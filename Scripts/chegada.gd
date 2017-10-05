# Nacaçapa é um software livre; você pode redistribuí-lo e/ou 
# modificá-lo sob os termos da Licença Pública Geral GNU como publicada
# pela Fundação do Software Livre (FSF); na versão 3 da Licença,
# ou (a seu critério) qualquer versão posterior.
# 
# Nacaçapa é distribuído na esperança de que possa ser útil, 
# mas SEM NENHUMA GARANTIA; sem uma garantia implícita de ADEQUAÇÃO
# a qualquer MERCADO ou APLICAÇÃO EM PARTICULAR. Veja a
# Licença Pública Geral GNU para mais detalhes.
# 
# Você deve ter recebido uma cópia da Licença Pública Geral GNU junto
# com Nacaçapa. Se não, veja <http://www.gnu.org/licenses/>.

extends TextureFrame

func _ready():
	var area = get_node("Area2D")
	area.set_scale(get_size() / get_texture().get_size())
	area.set_pos(get_size() / 2)
