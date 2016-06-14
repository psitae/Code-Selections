close all
clear
clc

r0 = [6713e3 0
      7343e3 0
     -7903e3 0];    % initial position
 
v0 = [0  8011
      0  8614
      0 -7672];
%       0 -6970];   % initial velocity

u = 3.986e14;       % gravitational parameter
dt = 1;             % seconds

% The end goal of the next section is to find E and H
% so that the nature of the orbits can be determined

n = 2;
nu = atan(r0(n,2)/r0(n,1));
flight_angle = arctan( v0(n,1) , v0(n,2) );
elevation_angle = (pi/2 + nu - flight_angle);
E = mag(v0(n,:))^2/2 - u/mag(r0(n,:))
H = mag(r0(n,:))*mag(v0(n,:))* cos (elevation_angle)

% this is a 4th order runge-kutta numerical differentiation
history = zeros(2,2e6,3);

% differential equation
dv = @(z) ( -u/mag(z)^3 ) * z; 

for j = 1:3
    % set variables to initial values defined above
    r = r0(j,:);
    v = v0(j,:);
    i = 1;

    while   1
        if mag(r - r0(j,:)) < 8000 && i > 100  % stop after one rev.
            break
        end
        history(1,i,j) = r(1);
        history(2,i,j) = r(2);
        vk1 = dt*dv(r);
        vk2 = dt*dv(r+vk1/2);
        vk3 = dt*dv(r+vk2/2);
        vk4 = dt*dv(r+vk3);
        v = v + 1/6 * (vk1 + 2*(vk2 + vk3) + vk4);
        r = r + dt*v;
        
        % mark orbit two when it's a good place to start guessing
        if j == 2 && abs( v(2) ) < 10 
            mark = i;
        end
        
        if j == 3   % stop transfer orbit when it hits orbit 2
            save = 1e8;
            k = mark;
            while 1
                distance = sqrt( (history(1,k,2) - r(1))^2 + ...
                                 (history(2,k,2) - r(2))^2 );   
                if distance - save > 0
                    % disp(k - mark) % --> algorithm is optimal
                    break
                else
                    k = k + 1;
                    save = distance;
                end
            end
            if distance < 8000
                break  
            end
        end
    i = i + 1;
    end
    fprintf('It took %5.0f seconds to complete Orbit #%d\n', dt*i, j)
end

% display the paths saved in history using plot

theta = linspace(0,2*pi,1000);
earthx = 6.378e6 * cos(theta);
earthy = 6.378e6 * sin(theta);

history(history==0) = NaN; %delete remaining zeros

f = figure(1);
plot(history(1,:,1) , history(2,:,1), ...
     history(1,:,2) , history(2,:,2), 'red', ...
     history(1,:,3) , history(2,:,3), 'magenta', ...
     earthx, earthy, 'go', ...
     'MarkerSize', 3)

range = 20e6;
axis([-range range -range range])
f.Position = ([50 50 700 620]);
legend 'Initial Orbit' 'Final Orbit' 'Transfer' 'Earth'
grid on
