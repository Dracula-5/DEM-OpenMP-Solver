program dem_parallel
    use omp_lib
    implicit none

    integer :: i, j, k, steps, N
    real(8) :: dt
    real(8), allocatable :: x(:), v(:), F(:)

    real(8) :: m, g, kn, R
    real(8) :: dist, overlap, Fn
    real(8) :: t1, t2

    
    N = 200        
    steps = 200
    dt = 0.001d0

    m = 1.0d0
    g = -9.81d0
    kn = 10000.0d0
    R = 0.01d0

    allocate(x(N), v(N), F(N))

    ! initialize particles
    do i = 1, N
        x(i) = 0.02d0 * i
        v(i) = 0.0d0
    end do

    call cpu_time(t1)

    do i = 1, steps

        F = 0.0d0

        ! gravity
        do j = 1, N
            F(j) = F(j) + m * g
        end do

        
        !$omp parallel do private(k, dist, overlap, Fn) shared(x, F)
        do j = 1, N
            do k = j+1, N

                dist = abs(x(j) - x(k))
                overlap = 2.0d0*R - dist

                if (overlap > 0.0d0) then
                    Fn = kn * overlap

                    if (x(j) < x(k)) then
                        !$omp atomic
                        F(j) = F(j) - Fn
                        !$omp atomic
                        F(k) = F(k) + Fn
                    else
                        !$omp atomic
                        F(j) = F(j) + Fn
                        !$omp atomic
                        F(k) = F(k) - Fn
                    end if

                end if

            end do
        end do
        !$omp end parallel do
        

        ! update particles
        do j = 1, N
            v(j) = v(j) + (F(j)/m) * dt
            x(j) = x(j) + v(j) * dt
        end do

    end do

    call cpu_time(t2)

    print *, "N =", N, " Time =", t2 - t1

    deallocate(x, v, F)

end program dem_parallel
