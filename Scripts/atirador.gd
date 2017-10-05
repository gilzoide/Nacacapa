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

extends Node2D

var bola = preload("res://Cenas/Bola.tscn")
var bolaAtual = null
var estaAtirando = false
const deltaGiro = -PI / 2
onready var pontoSpawn = get_node("Position2D")
export var velocidadeInicialBola = 100

func _ready():
	set_process_input(true)

func _input(event):
	if event.type == InputEvent.MOUSE_MOTION:
		look_at(event.pos)
	elif event.is_action_pressed("atira") and not estaAtirando:
		estaAtirando = true
		if not bolaAtual:
			bolaAtual = bola.instance()
		else:
			get_node("..").remove_child(bolaAtual)
		bolaAtual.para()
		bolaAtual.set_pos(pontoSpawn.get_pos())
		add_child(bolaAtual)
	elif event.is_action_released("atira") and estaAtirando:
		estaAtirando = false
		bolaAtual.set_pos(bolaAtual.get_global_pos())
		bolaAtual.impulsiona(get_rot() + deltaGiro, velocidadeInicialBola)
		remove_child(bolaAtual)
		get_node("..").add_child(bolaAtual)
