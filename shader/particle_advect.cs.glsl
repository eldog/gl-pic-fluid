layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;

uniform vec3 bounds_min;
uniform vec3 bounds_max;

void main() {
    uint index = gl_WorkGroupID.x;
    particle[index].pos += particle[index].vel;
    particle[index].pos = clamp(particle[index].pos, bounds_min, bounds_max);
}