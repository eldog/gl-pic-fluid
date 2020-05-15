layout (location=0) in vec3 pos;
layout (location=1) in vec3 vel;
layout (location=2) in int type;
layout (location=3) in float rhs;
layout (location=4) in vec4 a;
layout (location=5) in float pressure;

flat out int vs_display_mode;
out vec3 vs_pos;
out vec3 vs_color;
out vec3 vs_vel;

uniform mat4 projection;
uniform mat4 view;
uniform int display_mode;

void main() {
    vs_display_mode = display_mode;
    vs_pos = pos;
    vs_vel = vel;
    vs_color = vec3(1.0, 0, 1.0);

    if (display_mode == 0) {
        if (type == AIR) {vs_color = vec3(1.0, 0.0, 0.0);}
        if (type == SOLID) {vs_color = vec3(0.0, 1.0, 0.0);}
        if (type == FLUID) {vs_color = vec3(0.0, 0.0, 1.0);}
    }
    if (display_mode == 1) {
        vs_color = vec3(abs(vel)) * 10;
    }
    if (display_mode == 2) {
        vs_color = vec3(max(0, -rhs), max(0, rhs), 0);
    }
    if (display_mode == 3) {
        vs_color = vec3(abs(a.xyz));
    }
    if (display_mode == 4) {
        vs_color = isnan(pressure) ? vec3(1, 0, 1) : vec3(max(0, -pressure), max(0, pressure), 0);
    }
}
