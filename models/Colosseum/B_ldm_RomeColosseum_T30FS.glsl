precision highp float;
varying vec3 v_normal;
varying vec2 v_texcoord0;
uniform sampler2D u_ambient;
varying vec2 v_texcoord1;
uniform sampler2D u_diffuse;
varying vec2 v_texcoord2;
uniform sampler2D u_reflective;
uniform sampler2D u_specular;
uniform sampler2D u_bump;
uniform float u_shininess;
void main(void) {
vec3 normal = normalize(v_normal);
vec4 color = vec4(0., 0., 0., 0.);
vec4 diffuse = vec4(0., 0., 0., 1.);
vec4 reflective;
vec4 ambient;
vec4 specular;
ambient = texture2D(u_ambient, v_texcoord0);
diffuse = texture2D(u_diffuse, v_texcoord1);
reflective = texture2D(u_reflective, v_texcoord2);
specular = texture2D(u_specular, v_texcoord2);
diffuse.xyz += reflective.xyz;
diffuse.xyz *= max(dot(normal,vec3(0.,0.,1.)), 0.);
color.xyz += diffuse.xyz;
color = vec4(color.rgb * diffuse.a, diffuse.a);
gl_FragColor = color;
}
