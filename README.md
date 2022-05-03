# tec-LUNAR
TEC-1 Forth controlled 3D Lunar Lander Simulator on 3D moon.

The Lunar Lander program will allow the user to control the descent of a lunar lander onto the surface of the moon. The user will be able to control the thrust of the lander's engines and the orientation of the lander. The program will display a representation of the lander and the surface of the moon. The user will need to use the lander's thrusters to slow the descent and land the lander safely on the surface of the moon.



The following code is a basic example of how to land a lunar lander on the moon:
1. Set up the lander in the correct position for landing.
2. Make sure that all the safety checks are complete and that the lander is ready for landing.
3. Start the engines and begin the descent.
4. Monitor the lander's progress and make any necessary course corrections.
5. Touch down lightly on the surface of the moon.
6. Shut down the engines and complete the landing procedure.



- A subroutine to calculate the landing trajectory
```
implicit none

!*** Declare variables ***

real :: r, theta, phi, v, vx, vy, vz
real :: x, y, z, t, g

!*** Initialize variables ***

r = 3.844e8 ! Radius of the moon (m)
theta = 45.0 ! Angle of approach (degrees)
phi = 0.0 ! Angle of landing (degrees)
v = 1.0e3 ! Velocity of approach (m/s)
g = 1.62 ! Acceleration due to gravity (m/s^2)

!*** Convert theta and phi to radians ***

theta = theta * pi / 180.0
phi = phi * pi / 180.0

!*** Calculate the x, y, and z components of velocity ***

vx = v * cos(theta) * cos(phi)
vy = v * cos(theta) * sin(phi)
vz = v * sin(theta)

!*** Calculate the landing trajectory ***

x = r * cos(phi)
y = r * sin(phi)
z = 0.0
t = 0.0

do while (z >= 0.0)

vz = vz - g * t
z = z + vz * t
x = x + vx * t
y = y + vy * t
t = t + 0.1

end do

!*** Output the results ***

write (*,*) 'Landing position: ', x, y, z
write (*,*) 'Time of landing: ', t, ' seconds'

end
```
- A subroutine to calculate the landing velocity
```
! This program calculates the landing velocity required to land on the moon.

subroutine landing_velocity(v)

implicit none

real :: v ! landing velocity

real :: g ! acceleration due to gravity

real :: r ! radius of the moon

g = 1.62 ! m/s^2

r = 1737.1 ! km

v = sqrt(2 * g * r) ! m/s

end subroutine landing_velocity
```

- A subroutine to calculate the deceleration
```
! This program simulates the landing of a spacecraft on the moon.
! The deceleration is calculated using a subroutine.

program moon_landing

implicit none

real :: v_init, v_final, t_decel, decel

v_init = 100. ! Initial velocity in m/s

call deceleration(v_init, v_final, t_decel, decel)

print *, 'Deceleration: ', decel, 'm/s^2'
print *, 'Time to decelerate: ', t_decel, 's'

contains

subroutine deceleration(v_init, v_final, t_decel, decel)

! Calculates the deceleration of a spacecraft.

implicit none

real, intent(in) :: v_init, v_final
real, intent(out) :: t_decel, decel

t_decel = (v_init - v_final) / decel
decel = 2 * (v_init - v_final) / (t_decel**2)

end subroutine deceleration

end program moon_landing
```

- A subroutine to calculate the landing site
```
! this subroutine calculates the landing site for a spacecraft

subroutine calculate_landing_site(latitude, longitude, elevation)

! inputs

! latitude: the latitude of the landing site (in degrees)

! longitude: the longitude of the landing site (in degrees)

! elevation: the elevation of the landing site (in meters)

! output

! landing_site: the landing site coordinates (in meters)

real, intent(in) :: latitude, longitude, elevation

real, intent(out) :: landing_site(2)

! calculate the landing site coordinates

landing_site(1) = latitude * DEG_TO_RAD

landing_site(2) = longitude * DEG_TO_RAD

! calculate the elevation of the landing site

elevation = elevation + MOON_RADIUS

end subroutine calculate_landing_site
```
- A subroutine to calculate the lunar surface conditions
```
! Calculate the lunar surface conditions

subroutine surface(altitude, temperature, pressure, density)

implicit none

! Arguments

real, intent(in) :: altitude, temperature, pressure

! Local variables

real :: density

! Calculate the lunar surface conditions

density = pressure / (temperature * 287.058)

end subroutine surface
```
