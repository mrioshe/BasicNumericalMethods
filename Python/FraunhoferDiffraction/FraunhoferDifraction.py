import numpy as np
import matplotlib.pyplot as plt
from scipy.special import j1, sinc
import ipywidgets as widgets
from IPython.display import display

# Función para calcular y graficar el patrón de difracción

# Unidades que entran al programa:
# [a]=[b]=[R1]=[R2]=[D]=μm
# [wavelength]=nm
# [L]=mm
# [D_prima]= m

def plotDiffraction(wavelength, a, b, R1, R2, D, D_prima,L):

    a=a*1e-6
    b=b*1e-6
    R1=R1*1e-6
    R2=R2*1e-6
    D=D*1e-6
    wavelength=wavelength*1e-9
    L=L*1e-3

    # Parámetros
    k=2*np.pi / wavelength  # Número de onda

    # Grid en el plano x'-y' (campo lejano)
    N= 1024  # Número de puntos en la cuadrícula
    #L=0.01  # Tamaño de la cuadrícula (m)
    x_prima=np.linspace(-L/2,L/2,N)
    y_prima=np.linspace(-L/2,L/2,N)
    X_prima,Y_prima=np.meshgrid(x_prima,y_prima)
    r_prima=np.sqrt(X_prima**2+Y_prima**2)  # Coordenada radial en el campo lejano

    # Vectores de onda y parámetros
    k_r=(2*np.pi/wavelength)*(r_prima/D_prima)  # kr
    beta_x=(2*np.pi/wavelength)*(X_prima/D_prima) * a  # βx
    beta_y =(2*np.pi/wavelength)*(Y_prima/D_prima) * b  # βy

    # Patrón de difracción para el rectángulo
    E_rect=a*b*np.exp(-1j*(2*np.pi/wavelength)*(X_prima/D_prima)*D)*sinc((beta_x)/(2*np.pi))*sinc(beta_y/(2*np.pi))
    # Se divide por pi, debido a que la función sinc de scipy está normalizada

    # Patrón de difracción para el anillo

    mascara=r_prima != 0  # Evitar división por cero
    E_ring=np.zeros_like(r_prima, dtype=complex)
    E_ring[mascara]=2*np.pi*(R2**2*j1(k_r[mascara]*R2)/(k_r[mascara]* R2)-R1**2*j1(k_r[mascara]*R1)/(k_r[mascara]*R1))

    # Patrón de difracción total
    E_total=E_rect+E_ring
    I_total_norm=np.abs(E_total)**2  # Intensidad

    # Graficar el patrón de difracción
    plt.figure(figsize=(10, 8))
    plt.imshow(I_total_norm , extent=[-L/2, L/2, -L/2, L/2], cmap='jet')
    plt.colorbar(label='Intensidad Normalizada')
    plt.xlabel(r"$x'$ (m)")
    plt.ylabel(r"$y'$ (m)")
    #plt.xlim(-0.0010, 0.0010)  # Zoom in on x-axis
    #plt.ylim(-0.0010, 0.0010)  # Zoom in on y-axis
    plt.title('Patrón de Difracción de Fraunhofer (Rectángulo y Anillo, separados D)')
    plt.show()

    #Codigo para dar interactividad a la función de difracción:

slider_layout = widgets.Layout(width='700px')

# Rangos para los sliders (ajustados para cumplir condiciones de campo lejano)
wavelength_slider = widgets.FloatSlider(value=500, min=100, max=1000, step=10, description='λ (nm):', layout=slider_layout)
a_slider = widgets.FloatSlider(value=1000, min=1, max=5000, step=0.1, description='a (μm):', layout=slider_layout)
b_slider = widgets.FloatSlider(value=1000, min=1, max=5000, step=0.1, description='b (μm):', layout=slider_layout)
R1_slider = widgets.FloatSlider(value=800, min=1, max=5000, step=0.1, description='R1 (μm):', layout=slider_layout)
R2_slider = widgets.FloatSlider(value=1000, min=1, max=5000, step=0.1, description='R2 (μm):', layout=slider_layout)
D_slider = widgets.FloatSlider(value=7000, min=0, max=50000, step=0.1, description='D (μm):', layout=slider_layout)
D_prima_slider = widgets.FloatSlider(value=2, min=0.5, max=50, step=0.1, description="D' (m):", layout=slider_layout)
L_slider = widgets.FloatSlider(value=6, min=0.1, max=100, step=0.1, description="L' (mm):", layout=slider_layout)

# Interfaz interactiva
widgets.interact(
    plotDiffraction,
    wavelength=wavelength_slider,
    a=a_slider,
    b=b_slider,
    R1=R1_slider,
    R2=R2_slider,
    D=D_slider,
    D_prima=D_prima_slider,
    L=L_slider
);