CREATE procedure GetJugadorByID(@idJugador int)
as
begin
select J.*, E.Imagen, P.Imagen from Jugador J
inner join Equipo E on E.IdEquipo=J.IdEquipoActual
inner join Pais P on P.IdPais=J.IdPais
where IdJugador=@idJugador
end
go

CREATE procedure GetEquipoByID(@idEquipo int)
as
begin
select Equipo.*,Pais.Imagen from Equipo 
inner join Pais on Pais.IdPais=Equipo.IdPais
where IdEquipo=@idEquipo
end
go

CREATE procedure GetUsuarioByID(@idUsuario int)
as
begin
select * from  Usuario where IdUsuario=@idUsuario

end
go

CREATE procedure GetJugadoresByEquipo(@idEquipo int)
as
begin
select * from Jugador where IdEquipoActual=@idEquipo
end
go

CREATE procedure GetJugadoresByPais(@idPais int)
as
begin
select * from Jugador where IdPais=@idPais
end
go

CREATE procedure GetComentarioByJugador(@idJugador int)
as
begin
select * from Comentario where IdJugador=@idJugador
end
go

CREATE procedure GetEquiposByPais(@idPais int)
as
begin
select * from Equipo where IdPais=@idPais
end
go

CREATE procedure GetTitulosByEquipo(@idEquipo int)
as
begin
select * from TituloXEquipo 
inner join Titulos on Titulos.IdTitulo=TituloXEquipo.IdTitulo
where IdEquipo=@idEquipo
end
go

CREATE procedure GetTitulosByJugador(@idJugador int)
as
begin
select * from TituloXJugador
inner join Titulos on Titulos.IdTitulo=TituloXJugador.IdTitulo
where IdJugador=@idJugador
end
go

