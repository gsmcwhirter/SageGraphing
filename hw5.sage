import scipy
from scipy import integrate

def p4(K1,K2):
    def f(y,t):
        return [y[0] * (1 - (y[0] + y[1]) / K1), y[1] * (1 - (y[0] + y[1]) / K2)]
        
    def jac(y,t):
        return [[1 - (2 * y[0] + y[1]) / K1, -y[0] / K1],[-y[1] / K2, 1 - (2 * y[1] + y[0]) / K2]]
        
    return [f, jac]
    
p4d = p4(200,100)
x = scipy.arange(0,100,.1)
y = integrate.odeint(p4d[0], [2,3], x, Dfun=p4d[1])
y2 = integrate.odeint(p4d[0], [0.0001,99.9999], x, Dfun=p4d[1])

pts = [(y[i][0],y[i][1]) for i in range(len(x))]
pts2 = [(y2[i][0],y2[i][1]) for i in range(len(x))]
p = list_plot(pts, plotjoined=True, rgbcolor=(0,0,1), thickness=1, xmin=-0.25, xmax=205, ymin=-0.25, ymax=105)
p2 = list_plot(pts2, plotjoined=True, rgbcolor=(0,0,0), thickness=0.5, xmin=-0.25, xmax=205, ymin=-0.25, ymax=105)
(p + p2).show(figsize=6, axes_labels=("$y_1$","$y_2$"), filename="./hw5.png")

#osys = integrate.ode(*p4(200,100))
#r = osys.set_integrator("dopri5")
#r.set_initial_value([2,3],0)
#def integ(r, step):
#    def g(t):
#        return r.integrate(
#
#p = plot(r.integrate, xmin = 0, xmax = 100)
