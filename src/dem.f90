program dem
    implicit none

    character(len=20) :: mode
    character(len=100) :: filename
    integer :: i, steps

    real(8) :: z, v, t, dt
    real(8) :: m, g, kn, gamma, R
    real(8) :: F, overlap, Fn, vn

    mode = "freefall"
    call get_command_argument(1, mode)

    z = 1.0d0
    v = 0.0d0
    t = 0.0d0
    dt = 0.01d0

    m = 1.0d0
    g = -9.81d0
    kn = 10000.0d0
    gamma = 50.0d0
    R = 0.05d0

    steps = 500

    if (trim(mode) == "freefall") then
        filename = "../data/freefall.txt"

    else if (trim(mode) == "velocity") then
        filename = "../data/velocity.txt"
        v = 1.0d0
        g = 0.0d0

    else if (trim(mode) == "bounce") then
        filename = "../data/bounce.txt"

    else
        print *, "Invalid mode"
        stop
    end if

    open(10, file=filename, status="replace")

    do i = 1, steps

        F = m * g

        overlap = R - z

        if (overlap > 0.0d0 .and. trim(mode) == "bounce") then
            vn = v
            Fn = kn * overlap - gamma * vn
            if (Fn < 0.0d0) Fn = 0.0d0
            F = F + Fn
        end if

        v = v + (F / m) * dt
        z = z + v * dt

        write(10,*) t, z

        t = t + dt

    end do

    close(10)

end program dem
