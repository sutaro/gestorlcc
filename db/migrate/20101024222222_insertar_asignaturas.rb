# encoding: UTF-8
class InsertarAsignaturas < ActiveRecord::Migration
  
  def self.up
    asignatura=Asignatura.new(:codigo_asig=>"9999",
                              :nombre_asig=>"Varias situaciones",
                              :area_depto=>"",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>0,
                              :cuatrimestre=>0,
                              :abrevia_asig=>"Var. Sit.",
                              :titulacion_id=>1)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8052",
                              :nombre_asig=>"Ampliación de Ingeniería del Conocimiento",
                              :area_depto=>"CCIA",
                              :caracter=>"OB",
                              :coeficiente_exp=>1,
                              :curso=>5,
                              :cuatrimestre=>0,
                              :abrevia_asig=>"Amp. Ing. Conoc.",
                              :titulacion_id=>12)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8029",
                              :nombre_asig=>"Inteligencia Artificial e Ingeniería del Conocimiento",
                              :area_depto=>"CCIA",
                              :caracter=>"TR",
                              :coeficiente_exp=>1,
                              :curso=>4,
                              :cuatrimestre=>0,
                              :abrevia_asig=>"I.A. e Ing. Conoc.",
                              :titulacion_id=>12)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8047",
                              :nombre_asig=>"Modelos Computacionales",
                              :area_depto=>"CCIA",
                              :caracter=>"OB",
                              :coeficiente_exp=>1,
                              :curso=>3,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Mod. Comp.",
                              :titulacion_id=>12)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8077",
                              :nombre_asig=>"Modelos de Evaluación de Rendimiento de Sistemas",
                              :area_depto=>"CCIA",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>0,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Mod. Eval. Rend. Sist.",
                              :titulacion_id=>12)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8079",
                              :nombre_asig=>"Procesamiento de Imágenes",
                              :area_depto=>"CCIA",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>0,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Proc. Imag.",
                              :titulacion_id=>12)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8058",
                              :nombre_asig=>"Gráficos por Ordenador",
                              :area_depto=>"LSI",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>3,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Graf. Ord.",
                              :titulacion_id=>12)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8022",
                              :nombre_asig=>"Teoría de Autómatas y Lenguajes Formales",
                              :area_depto=>"CCIA",
                              :caracter=>"TR",
                              :coeficiente_exp=>1,
                              :curso=>2,
                              :cuatrimestre=>0,
                              :abrevia_asig=>"T. Aut. y Mod. Form.",
                              :titulacion_id=>12)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8094",
                              :nombre_asig=>"Teoría de la Información y la Codificación",
                              :area_depto=>"CCIA",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>0,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"T. Inf. y Codif.",
                              :titulacion_id=>12)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8074",
                              :nombre_asig=>"Ingeniería de Protocolos",
                              :area_depto=>"IT",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>0,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Ing. Prot.",
                              :titulacion_id=>12)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8082",
                              :nombre_asig=>"Protección de la Información en Redes",
                              :area_depto=>"IT",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>0,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Prot. Inf. Redes",
                              :titulacion_id=>12)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8089",
                              :nombre_asig=>"Software de Comunicaciones",
                              :area_depto=>"IT",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>0,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Soft. Comun.",
                              :titulacion_id=>12)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8021",
                              :nombre_asig=>"Análisis y Diseño de Algoritmos",
                              :area_depto=>"LSI",
                              :caracter=>"TR",
                              :coeficiente_exp=>1,
                              :curso=>2,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"An. Dis. Alg.",
                              :titulacion_id=>12)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8065",
                              :nombre_asig=>"Auditoría Informática",
                              :area_depto=>"LSI",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>0,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Audit. Inf",
                              :titulacion_id=>12)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8023",
                              :nombre_asig=>"Diseño y Utilización de Bases de Datos",
                              :area_depto=>"LSI",
                              :caracter=>"TR",
                              :coeficiente_exp=>1,
                              :curso=>3,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Dis. Util. BBDD",
                              :titulacion_id=>12)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8043",
                              :nombre_asig=>"Administración de Bases de Datos",
                              :area_depto=>"LSI",
                              :caracter=>"OB",
                              :coeficiente_exp=>1,
                              :curso=>3,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Admon. BBDD",
                              :titulacion_id=>12)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8066",
                              :nombre_asig=>"Calculabilidad y Complejidad",
                              :area_depto=>"LSI",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>0,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Calc. y Comp.",
                              :titulacion_id=>12)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8032",
                              :nombre_asig=>"Comunicación de Datos",
                              :area_depto=>"LSI",
                              :caracter=>"TR",
                              :coeficiente_exp=>1,
                              :curso=>4,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Comun. Datos",
                              :titulacion_id=>12)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8090",
                              :nombre_asig=>"Bases de Datos Avanzadas",
                              :area_depto=>"LSI",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>0,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"BBDD Avanz.",
                              :titulacion_id=>12)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8027",
                              :nombre_asig=>"Ingeniería del Software - Diseño",
                              :area_depto=>"LSI",
                              :caracter=>"TR",
                              :coeficiente_exp=>1,
                              :curso=>4,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Ing. Soft. Diseño",
                              :titulacion_id=>12)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8028",
                              :nombre_asig=>"Ingeniería del Software - Especificación",
                              :area_depto=>"LSI",
                              :caracter=>"TR",
                              :coeficiente_exp=>1,
                              :curso=>4,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Ing. Soft. Espec.",
                              :titulacion_id=>12)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8033",
                              :nombre_asig=>"Ingeniería del Software - Proyectos",
                              :area_depto=>"LSI",
                              :caracter=>"TR",
                              :coeficiente_exp=>1,
                              :curso=>5,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Ing. Soft. Proy.",
                              :titulacion_id=>12)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8040",
                              :nombre_asig=>"Laboratorio de Tecnología de Objetos",
                              :area_depto=>"LSI",
                              :caracter=>"OB",
                              :coeficiente_exp=>1,
                              :curso=>2,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Lab. Tec. Obj.",
                              :titulacion_id=>12)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8046",
                              :nombre_asig=>"Lenguajes de Programación",
                              :area_depto=>"LSI",
                              :caracter=>"OB",
                              :coeficiente_exp=>1,
                              :curso=>3,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Leng. Prog.",
                              :titulacion_id=>12)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8030",
                              :nombre_asig=>"Procesadores de Lenguajes",
                              :area_depto=>"LSI",
                              :caracter=>"TR",
                              :coeficiente_exp=>1,
                              :curso=>4,
                              :cuatrimestre=>0,
                              :abrevia_asig=>"Proc. Leng.",
                              :titulacion_id=>12)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8048",
                              :nombre_asig=>"Programación Concurrente",
                              :area_depto=>"LSI",
                              :caracter=>"OB",
                              :coeficiente_exp=>1,
                              :curso=>3,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Prog. Conc.",
                              :titulacion_id=>12)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8049",
                              :nombre_asig=>"Programación Declarativa",
                              :area_depto=>"LSI",
                              :caracter=>"OB",
                              :coeficiente_exp=>1,
                              :curso=>3,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Prog. Decl.",
                              :titulacion_id=>12)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8080",
                              :nombre_asig=>"Programación Declarativa Avanzada",
                              :area_depto=>"LSI",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>0,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Prog. Decl. Av.",
                              :titulacion_id=>12)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8081",
                              :nombre_asig=>"Programación Distribuida",
                              :area_depto=>"LSI",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>0,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Prog. Dist.",
                              :titulacion_id=>12)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8086",
                              :nombre_asig=>"Sistemas de Información",
                              :area_depto=>"LSI",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>0,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Sist. de Inf.",
                              :titulacion_id=>12)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8088",
                              :nombre_asig=>"Sistemas Operativos Distribuidos",
                              :area_depto=>"LSI",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>0,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"SSOO Dist.",
                              :titulacion_id=>12)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8024",
                              :nombre_asig=>"Sistemas Operativos",
                              :area_depto=>"LSI",
                              :caracter=>"TR",
                              :coeficiente_exp=>1,
                              :curso=>3,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"SSOO",
                              :titulacion_id=>12)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8020",
                              :nombre_asig=>"Tipos Abstractos de Datos",
                              :area_depto=>"LSI",
                              :caracter=>"TR",
                              :coeficiente_exp=>1,
                              :curso=>2,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"T.A.D.",
                              :titulacion_id=>12)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8035",
                              :nombre_asig=>"Gestión de Proyectos",
                              :area_depto=>"LSI",
                              :caracter=>"TR",
                              :coeficiente_exp=>1,
                              :curso=>5,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Gest. Proy.",
                              :titulacion_id=>12)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8062",
                              :nombre_asig=>"Aplicaciones Telemáticas Avanzadas",
                              :area_depto=>"IT",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>0,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Apl. Tel. Av.",
                              :titulacion_id=>12)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8060",
                              :nombre_asig=>"Técnicas Computacionales de la Investigación Operativa",
                              :area_depto=>"CCIA",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>3,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Téc. Comp. Inv. Op.",
                              :titulacion_id=>12)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"979",
                              :nombre_asig=>"Sistemas Inteligentes",
                              :area_depto=>"CCIA",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>5,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Sist. int.",
                              :titulacion_id=>13)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"974",
                              :nombre_asig=>"Laboratorio de Software de Comunicaciones",
                              :area_depto=>"IT",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>5,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Lab. Soft. Com.",
                              :titulacion_id=>13)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"916",
                              :nombre_asig=>"Redes de Ordenadores",
                              :area_depto=>"IT",
                              :caracter=>"TR",
                              :coeficiente_exp=>1,
                              :curso=>4,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Redes Ord.",
                              :titulacion_id=>13)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"972",
                              :nombre_asig=>"Software de Comunicaciones",
                              :area_depto=>"IT",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>5,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Soft. Com.",
                              :titulacion_id=>13)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"980",
                              :nombre_asig=>"Bases de Datos",
                              :area_depto=>"LSI",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>5,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"BBDD",
                              :titulacion_id=>13)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"968",
                              :nombre_asig=>"Ingeniería del Software",
                              :area_depto=>"LSI",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>5,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Ing. Soft.",
                              :titulacion_id=>13)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"975",
                              :nombre_asig=>"Laboratorio de Ingeniería del Software",
                              :area_depto=>"LSI",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>5,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Lab. Ing. Soft.",
                              :titulacion_id=>13)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"967",
                              :nombre_asig=>"Programación Concurrente",
                              :area_depto=>"LSI",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>5,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Prog. Conc.",
                              :titulacion_id=>13)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"938",
                              :nombre_asig=>"Software de Sistemas",
                              :area_depto=>"CCIA",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>0,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Soft. Sis.",
                              :titulacion_id=>13)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8120",
                              :nombre_asig=>"Modelos Computacionales",
                              :area_depto=>"CCIA",
                              :caracter=>"OB",
                              :coeficiente_exp=>1,
                              :curso=>3,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Mod. Comp.",
                              :titulacion_id=>14)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8139",
                              :nombre_asig=>"Introducción a la Inteligencia Artificial",
                              :area_depto=>"CCIA",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>3,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Int. I.A.",
                              :titulacion_id=>14)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8100",
                              :nombre_asig=>"Laboratorio de Estadística Computacional",
                              :area_depto=>"CCIA",
                              :caracter=>"TR",
                              :coeficiente_exp=>1,
                              :curso=>2,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Lab. Est. Comp.",
                              :titulacion_id=>14)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8117",
                              :nombre_asig=>"Teoría de Autómatas y Lenguajes Formales",
                              :area_depto=>"CCIA",
                              :caracter=>"OB",
                              :coeficiente_exp=>1,
                              :curso=>2,
                              :cuatrimestre=>0,
                              :abrevia_asig=>"T. de Aut. y Leng. Form.",
                              :titulacion_id=>14)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8104",
                              :nombre_asig=>"Administración de Bases de Datos",
                              :area_depto=>"LSI",
                              :caracter=>"TR",
                              :coeficiente_exp=>1,
                              :curso=>3,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Admón. de BBDD",
                              :titulacion_id=>14)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8103",
                              :nombre_asig=>"Análisis y Diseño de Algoritmos",
                              :area_depto=>"LSI",
                              :caracter=>"TR",
                              :coeficiente_exp=>1,
                              :curso=>2,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Anal. y Dis. Alg.",
                              :titulacion_id=>14)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8112",
                              :nombre_asig=>"Diseño y Utilización de BBDD",
                              :area_depto=>"LSI",
                              :caracter=>"OB",
                              :coeficiente_exp=>1,
                              :curso=>2,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Dis. y Util. de BBDD",
                              :titulacion_id=>14)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8119",
                              :nombre_asig=>"Informática Distribuida",
                              :area_depto=>"LSI",
                              :caracter=>"OB",
                              :coeficiente_exp=>1,
                              :curso=>3,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Inf. Dist.",
                              :titulacion_id=>14)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8171",
                              :nombre_asig=>"Sistemas de Información Empresarial",
                              :area_depto=>"LSI",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>3,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Sist. Inf. Emp.",
                              :titulacion_id=>14)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8121",
                              :nombre_asig=>"Programación Declarativa",
                              :area_depto=>"LSI",
                              :caracter=>"OB",
                              :coeficiente_exp=>1,
                              :curso=>3,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Prog. Decl.",
                              :titulacion_id=>14)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8114",
                              :nombre_asig=>"Laboratorio de Tecnología de Objetos",
                              :area_depto=>"LSI",
                              :caracter=>"OB",
                              :coeficiente_exp=>1,
                              :curso=>2,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Lab. Tec. Obj.",
                              :titulacion_id=>14)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8105",
                              :nombre_asig=>"Ingeniería del Software de Gestión",
                              :area_depto=>"LSI",
                              :caracter=>"TR",
                              :coeficiente_exp=>1,
                              :curso=>3,
                              :cuatrimestre=>0,
                              :abrevia_asig=>"Ing. Soft. Gest.",
                              :titulacion_id=>14)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8106",
                              :nombre_asig=>"Sistemas Operativos",
                              :area_depto=>"LSI",
                              :caracter=>"TR",
                              :coeficiente_exp=>1,
                              :curso=>3,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"SSOO",
                              :titulacion_id=>14)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8102",
                              :nombre_asig=>"Tipos Abstractos de Datos",
                              :area_depto=>"LSI",
                              :caracter=>"TR",
                              :coeficiente_exp=>1,
                              :curso=>2,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"T.A.D.",
                              :titulacion_id=>14)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8149",
                              :nombre_asig=>"Investigación Operativa de Sistemas",
                              :area_depto=>"CCIA",
                              :caracter=>"OB",
                              :coeficiente_exp=>1,
                              :curso=>2,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Inv. Op. Sist.",
                              :titulacion_id=>15)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8153",
                              :nombre_asig=>"Modelos Computacionales",
                              :area_depto=>"CCIA",
                              :caracter=>"OB",
                              :coeficiente_exp=>1,
                              :curso=>3,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Mod. Comp.",
                              :titulacion_id=>15)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8142",
                              :nombre_asig=>"Teoría de Autómatas y Lenguajes Formales",
                              :area_depto=>"CCIA",
                              :caracter=>"TR",
                              :coeficiente_exp=>1,
                              :curso=>2,
                              :cuatrimestre=>0,
                              :abrevia_asig=>"T. Aut. y Leng. Form.",
                              :titulacion_id=>15)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8161",
                              :nombre_asig=>"Diseño de Redes Telemáticas",
                              :area_depto=>"IT",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>0,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Dis. Redes Telem.",
                              :titulacion_id=>15)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8167",
                              :nombre_asig=>"Seguridad en Redes Telemáticas",
                              :area_depto=>"IT",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>3,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Seg. Redes Telem.",
                              :titulacion_id=>15)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8164",
                              :nombre_asig=>"Laboratorio de Redes",
                              :area_depto=>"IT",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>3,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Lab. Redes",
                              :titulacion_id=>15)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8140",
                              :nombre_asig=>"Redes",
                              :area_depto=>"IT",
                              :caracter=>"TR",
                              :coeficiente_exp=>1,
                              :curso=>2,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Redes",
                              :titulacion_id=>15)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8138",
                              :nombre_asig=>"Análisis y Diseño de Algoritmos",
                              :area_depto=>"LSI",
                              :caracter=>"TR",
                              :coeficiente_exp=>1,
                              :curso=>2,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Anal. y Dis. Alg.",
                              :titulacion_id=>15)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8143",
                              :nombre_asig=>"Bases de Datos",
                              :area_depto=>"LSI",
                              :caracter=>"TR",
                              :coeficiente_exp=>1,
                              :curso=>3,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"BBDD",
                              :titulacion_id=>15)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8162",
                              :nombre_asig=>"Ingeniería del Software",
                              :area_depto=>"LSI",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>3,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Ing. Soft.",
                              :titulacion_id=>15)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8150",
                              :nombre_asig=>"Laboratorio de Tecnología de Objetos",
                              :area_depto=>"LSI",
                              :caracter=>"OB",
                              :coeficiente_exp=>1,
                              :curso=>2,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Lab. Tecnol. Obj.",
                              :titulacion_id=>15)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8158",
                              :nombre_asig=>"Ampliación de Programación",
                              :area_depto=>"LSI",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>3,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Amp. Prog.",
                              :titulacion_id=>15)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8166",
                              :nombre_asig=>"Programación de Sistemas en Tiempo Real",
                              :area_depto=>"LSI",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>0,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Prog. Sist. en T.R.",
                              :titulacion_id=>15)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8154",
                              :nombre_asig=>"Programación Declarativa",
                              :area_depto=>"LSI",
                              :caracter=>"OB",
                              :coeficiente_exp=>1,
                              :curso=>3,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Prog. Decl.",
                              :titulacion_id=>15)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8165",
                              :nombre_asig=>"Programación Concurrente",
                              :area_depto=>"LSI",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>3,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Prog. Conc.",
                              :titulacion_id=>15)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8144",
                              :nombre_asig=>"Sistemas Operativos",
                              :area_depto=>"LSI",
                              :caracter=>"TR",
                              :coeficiente_exp=>1,
                              :curso=>3,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"SSOO",
                              :titulacion_id=>15)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8134",
                              :nombre_asig=>"Tipos Abstractos de Datos",
                              :area_depto=>"LSI",
                              :caracter=>"TR",
                              :coeficiente_exp=>1,
                              :curso=>2,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"T.A.D.",
                              :titulacion_id=>15)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8141",
                              :nombre_asig=>"Traductores Compiladores e Intérpretes",
                              :area_depto=>"LSI",
                              :caracter=>"OB",
                              :coeficiente_exp=>1,
                              :curso=>3,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Trad. Comp. e Int.",
                              :titulacion_id=>15)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"8163",
                              :nombre_asig=>"Laboratorio de Bases de Datos",
                              :area_depto=>"LSI",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>3,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Lab. BBDD",
                              :titulacion_id=>15)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"4319",
                              :nombre_asig=>"Redes de Computadores",
                              :area_depto=>"LSI",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>0,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Redes Comp.",
                              :titulacion_id=>16)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"4221",
                              :nombre_asig=>"Fundamentos de los Computadores",
                              :area_depto=>"LSI",
                              :caracter=>"TR",
                              :coeficiente_exp=>1,
                              :curso=>2,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Fund. Comp.",
                              :titulacion_id=>16)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"4392",
                              :nombre_asig=>"Sistemas Operativos",
                              :area_depto=>"LSI",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>0,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"SSOO",
                              :titulacion_id=>16)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"4308",
                              :nombre_asig=>"Laboratorio de Diseño Gráfico y Animación por Ordenador",
                              :area_depto=>"CCIA",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>0,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Lab. Dis. Graf y Anim. Ord.",
                              :titulacion_id=>17)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"4419",
                              :nombre_asig=>"Aplicaciones en Redes Locales",
                              :area_depto=>"IT",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>0,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Apl. Redes Loc.",
                              :titulacion_id=>17)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"4324",
                              :nombre_asig=>"Técnicas Computacionales para la Telecomunicación",
                              :area_depto=>"CCIA",
                              :caracter=>"OB",
                              :coeficiente_exp=>1,
                              :curso=>0,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Téc. Comp. Telec.",
                              :titulacion_id=>18)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"4403",
                              :nombre_asig=>"Laboratorio de Software de Comunicaciones",
                              :area_depto=>"IT",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>0,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Lab. Soft. Com.",
                              :titulacion_id=>18)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"7102",
                              :nombre_asig=>"Redes de Computadores",
                              :area_depto=>"IT",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>0,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Redes Comp.",
                              :titulacion_id=>18)
    asignatura.save!
  end

  def self.down

  end
end
