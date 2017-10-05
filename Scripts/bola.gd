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

extends RigidBody2D

export var raio = 20
export var cor = Color(0, 0, 0)

func _ready():
	get_node("CollisionShape2D").get_shape().set_radius(raio)

func _draw():
	draw_circle(Vector2(0, 0), raio, cor)

func para():
	set_mode(RigidBody2D.MODE_STATIC)

func impulsiona(r, velocidade):
	var frente = Vector2(velocidade, 0).rotated(r)
	set_mode(RigidBody2D.MODE_RIGID)
	set_linear_velocity(frente)
