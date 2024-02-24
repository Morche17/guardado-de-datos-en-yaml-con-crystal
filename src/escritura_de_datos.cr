require "yaml"

# Definir el tipo de datos del hash vacío para almacenar las opciones
options = {} of String => String

# Variables para almacenar la clave y el valor
key = ""
value = ""

# Obtener los argumentos de línea de comandos
args = ARGV

# Procesar los argumentos uno por uno
args.each_with_index do |arg, index|
  case arg
  when "-k", "--key"
    key = args[index + 1]
  when "-v", "--value"
    value = args[(index + 1)..-1].join(" ")
  end
end

# Verificar que se hayan proporcionado ambos argumentos
unless key != "" && value != ""
  puts "Se requieren tanto una clave como un valor"
  exit 1
end

# Construir el hash con los argumentos proporcionados
datos = {
  key => value
}

# Ruta del archivo YAML
archivo = "datos.yml"

# Escribir los datos en el archivo YAML
File.write(archivo, YAML.dump(datos))

puts "Datos escritos en #{archivo}:"
puts YAML.dump(datos)

