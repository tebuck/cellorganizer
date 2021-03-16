function J_sine_sph_i = calc_sine_3_jacobian_sphere(x12,x13,x14,x22,x23,x24,x32,x33,x34)
%CALC_SINE_3_JACOBIAN_SPHERE
%    J_SINE_SPH_I = CALC_SINE_3_JACOBIAN_SPHERE(X12,X13,X14,X22,X23,X24,X32,X33,X34)

%    This function was generated by the Symbolic Math Toolbox version 7.2.
%    10-Mar-2018 21:49:19

t2 = x23.*x34;
t3 = x24.*x32;
t4 = x22.*x33;
t5 = x13.*x34;
t6 = x13.*x24;
t27 = x14.*x23;
t7 = t6-t27;
t8 = t7.*x32;
t9 = x14.*x33;
t29 = x24.*x33;
t10 = t2-t29;
t11 = t10.*x12;
t12 = x12.*x34;
t13 = x12.*x24;
t31 = x14.*x22;
t14 = t13-t31;
t33 = x14.*x32;
t15 = t12-t33;
t16 = t15.*x23;
t34 = x22.*x34;
t17 = t3-t34;
t18 = t17.*x13;
t32 = t14.*x33;
t19 = t16+t18-t32;
t20 = x12.*x33;
t21 = x12.*x23;
t35 = x13.*x22;
t22 = t21-t35;
t23 = t22.*x34;
t24 = x13.*x32;
t37 = x23.*x32;
t25 = t4-t37;
t26 = t25.*x14;
t28 = t5-t9;
t30 = t8+t11-t28.*x22;
t36 = t20-t24;
t38 = t23+t26-t36.*x24;
J_sine_sph_i = reshape([0.0,0.0,0.0,t2-x12.*(t8+t11-x22.*(t5-x14.*x33))-x24.*x33,-t5+t9-t30.*x22,t6-t27-t30.*x32,t3-t19.*x13-x22.*x34,t12-t19.*x23-x14.*x32,-t13+t31-t19.*x33,t4-x14.*(t23+t26-x24.*(t20-x13.*x32))-x23.*x32,-t20+t24-t38.*x24,t21-t35-t38.*x34],[3,4]);
