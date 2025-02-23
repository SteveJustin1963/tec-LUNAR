import pygame
import sys

# Initialize pygame
pygame.init()

# Game constants
WIDTH, HEIGHT = 400, 600
GRAVITY = 0.1  # Simulated gravity
THRUST = -0.5  # Thrust force when pressing 'M'
FUEL_CONSUMPTION = 1  # Fuel decrease per thrust
LANDING_SPEED_THRESHOLD = 2  # Max speed to land safely

# Colors
WHITE = (255, 255, 255)
BLACK = (0, 0, 0)
RED = (255, 0, 0)
GREEN = (0, 255, 0)

# Initialize screen
screen = pygame.display.set_mode((WIDTH, HEIGHT))
pygame.display.set_caption("Moon Lander")

# Lander properties
lander = pygame.Rect(WIDTH // 2 - 15, 50, 30, 30)
velocity = 0  # Vertical velocity
fuel = 100  # Fuel left

def draw_lander():
    pygame.draw.rect(screen, WHITE, lander)

def display_info():
    font = pygame.font.Font(None, 24)
    text = font.render(f"Velocity: {velocity:.2f}  Fuel: {fuel}  Altitude: {lander.y}", True, WHITE)
    screen.blit(text, (10, 10))

def main():
    global velocity, fuel
    clock = pygame.time.Clock()
    running = True
    thrust = False
    
    while running:
        screen.fill(BLACK)
        
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                running = False
            elif event.type == pygame.KEYDOWN:
                print(f"KEYDOWN event: {event.key}")  # Debugging key press
                if event.key == pygame.K_m and fuel > 0:
                    thrust = True
                    print("Thrust activated")  # Debugging thrust activation
            elif event.type == pygame.KEYUP:
                print(f"KEYUP event: {event.key}")  # Debugging key release
                if event.key == pygame.K_m:
                    thrust = False
                    print("Thrust deactivated")  # Debugging thrust deactivation
        
        # Apply gravity
        velocity += GRAVITY
        
        # Apply thrust
        if thrust and fuel > 0:
            velocity += THRUST
            fuel -= FUEL_CONSUMPTION
        
        # Update lander position
        lander.y += int(velocity)
        
        # Prevent the lander from going off the screen at the top
        if lander.y < 0:
            lander.y = 0
            velocity = 0
        
        # Check landing conditions
        if lander.y + lander.height >= HEIGHT - 10:
            lander.y = HEIGHT - 10 - lander.height
            if abs(velocity) > LANDING_SPEED_THRESHOLD:
                message = "CRASH!"  # Too fast, crash
                color = RED
            else:
                message = "LANDED SAFELY!"  # Landed safely
                color = GREEN
            text = pygame.font.Font(None, 36).render(message, True, color)
            screen.blit(text, (WIDTH // 2 - 80, HEIGHT // 2))
            pygame.display.flip()
            pygame.time.delay(3000)
            running = False
        
        draw_lander()
        display_info()
        pygame.display.flip()
        clock.tick(30)
        
        # Debugging print statements
        print(f"Lander Y: {lander.y}, Velocity: {velocity:.2f}, Fuel: {fuel}, Thrust: {thrust}")
    
    pygame.quit()
    sys.exit()

if __name__ == "__main__":
    main()
