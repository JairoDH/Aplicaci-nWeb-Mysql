from funciones import *
from flask import Flask, render_template, abort, request
import pymysql

app = Flask(__name__)


@app.route('/')
def login():
    return render_template('login.html')


@app.route('/inicio', methods=["POST"])
def inicio():
    usuario=request.form.get("usuario")
    contrasena=request.form.get("contraseña")
    maquina1='dirección_IP'
    nombredb1='medico'
    conex= pymysql.connect(host=maquina1,user=usuario,password=contrasena,database=nombredb1)
    datos=Mostrar_citas(conex)
    return render_template("inicio.html",datos=datos)

app.run('0.0.0.0', 5000, debug=False)
    
