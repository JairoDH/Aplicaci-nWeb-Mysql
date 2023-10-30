# Fichero de funciones

##Función para mostrar información tras la conexión.

def Mostrar_citas(db):
    sql= ("SELECT pacientes.nombre,citas.fecha_hora_cita,doctores.nombre FROM citas INNER JOIN pacientes ON citas.cod_paciente = pacientes.cod_paciente INNER JOIN doctores ON citas.cod_doctor = doctores.cod_doctor")
    
    cursor=db.cursor()
    cursor.execute(sql)
    datos = cursor.fetchall()
    return datos
