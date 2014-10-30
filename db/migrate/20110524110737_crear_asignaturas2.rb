# encoding: UTF-8
class CrearAsignaturas2 < ActiveRecord::Migration
  def self.up
    asignatura=Asignatura.new(:codigo_asig=>"4211",
                              :nombre_asig=>"Fundamentos de los Computadores",
                              :area_depto=>"LSI",
                              :caracter=>"TR",
                              :coeficiente_exp=>1,
                              :curso=>2,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Fund. Comp.",
                              :titulacion_id=>8)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"52100",
                              :nombre_asig=>"Programación 1",
                              :area_depto=>"LSI",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>1,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Prog. 1",
                              :titulacion_id=>9)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"52105",
                              :nombre_asig=>"Programación 2",
                              :area_depto=>"LSI",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>1,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Prog. 2",
                              :titulacion_id=>9)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"52149",
                              :nombre_asig=>"Programación 1",
                              :area_depto=>"LSI",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>1,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Prog. 1",
                              :titulacion_id=>11)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"52154",
                              :nombre_asig=>"Programación 2",
                              :area_depto=>"LSI",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>1,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Prog. 2",
                              :titulacion_id=>11)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"52392",
                              :nombre_asig=>"Programación 1",
                              :area_depto=>"LSI",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>1,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Prog. 1",
                              :titulacion_id=>10)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"52396",
                              :nombre_asig=>"Programación 2",
                              :area_depto=>"LSI",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>1,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Prog. 2",
                              :titulacion_id=>10)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"52342",
                              :nombre_asig=>"Programación 1",
                              :area_depto=>"LSI",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>1,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Prog. 1",
                              :titulacion_id=>7)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"52347",
                              :nombre_asig=>"Programación 2",
                              :area_depto=>"LSI",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>1,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Prog. 2",
                              :titulacion_id=>7)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"51681",
                              :nombre_asig=>"Programación Orientada a Objetos",
                              :area_depto=>"LSI",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>1,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Prog. Or. Obj.",
                              :titulacion_id=>6)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"51141",
                              :nombre_asig=>"Fundamentos de Programación",
                              :area_depto=>"LSI",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>1,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Fund. Prog.",
                              :titulacion_id=>5)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"51146",
                              :nombre_asig=>"Programación Orientada a Objetos",
                              :area_depto=>"LSI",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>1,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Prog. Or. Obj.",
                              :titulacion_id=>5)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"51676",
                              :nombre_asig=>"Fundamentos de Programación",
                              :area_depto=>"LSI",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>1,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Fund. Prog.",
                              :titulacion_id=>6)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"50661",
                              :nombre_asig=>"Fundamentos de Programación",
                              :area_depto=>"LSI",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>1,
                              :cuatrimestre=>1,
                              :abrevia_asig=>"Fund. Prog.",
                              :titulacion_id=>4)
    asignatura.save!
    asignatura=Asignatura.new(:codigo_asig=>"50666",
                              :nombre_asig=>"Programación Orientada a Objetos",
                              :area_depto=>"LSI",
                              :caracter=>"OP",
                              :coeficiente_exp=>1,
                              :curso=>1,
                              :cuatrimestre=>2,
                              :abrevia_asig=>"Prog. Or. Obj.",
                              :titulacion_id=>4)
    asignatura.save!
  end

  def self.down
  end
end
