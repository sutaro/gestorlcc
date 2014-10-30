require 'test_helper'

class CorreoTecnicosTest < ActionMailer::TestCase
  test "aperturalectivo" do
    @expected.subject = 'CorreoTecnicos#aperturalectivo'
    @expected.body    = read_fixture('aperturalectivo')
    @expected.date    = Time.now

    assert_equal @expected.encoded, CorreoTecnicos.create_aperturalectivo(@expected.date).encoded
  end

  test "aperturaexamen" do
    @expected.subject = 'CorreoTecnicos#aperturaexamen'
    @expected.body    = read_fixture('aperturaexamen')
    @expected.date    = Time.now

    assert_equal @expected.encoded, CorreoTecnicos.create_aperturaexamen(@expected.date).encoded
  end

  test "cierrelectivo" do
    @expected.subject = 'CorreoTecnicos#cierrelectivo'
    @expected.body    = read_fixture('cierrelectivo')
    @expected.date    = Time.now

    assert_equal @expected.encoded, CorreoTecnicos.create_cierrelectivo(@expected.date).encoded
  end

  test "cierreexamen" do
    @expected.subject = 'CorreoTecnicos#cierreexamen'
    @expected.body    = read_fixture('cierreexamen')
    @expected.date    = Time.now

    assert_equal @expected.encoded, CorreoTecnicos.create_cierreexamen(@expected.date).encoded
  end

  test "emitesolicitudlectivo" do
    @expected.subject = 'CorreoTecnicos#emitesolicitudlectivo'
    @expected.body    = read_fixture('emitesolicitudlectivo')
    @expected.date    = Time.now

    assert_equal @expected.encoded, CorreoTecnicos.create_emitesolicitudlectivo(@expected.date).encoded
  end

  test "emitesolicitudexamen" do
    @expected.subject = 'CorreoTecnicos#emitesolicitudexamen'
    @expected.body    = read_fixture('emitesolicitudexamen')
    @expected.date    = Time.now

    assert_equal @expected.encoded, CorreoTecnicos.create_emitesolicitudexamen(@expected.date).encoded
  end

end
