USE [master]
GO
/****** Object:  StoredProcedure [dbo].[impersonal]    Script Date: 03/30/2011 10:40:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Soy el administrador de la instancia [DIRECCION\Administrador]
-- Necesito que el usuario pepe (es un administrador de red) pueda crear una cuenta de inicio de sesión 
-- para cualquiera de los empleados
-- Le concedemos a pepe el permiso impersonate sobre la cuenta [DIRECCION\Ignacio] que sí que tiene el permiso de crear 
-- cuentas de inicio de sesión

use [master]
GO
GRANT IMPERSONATE ON LOGIN::[DIRECCION\ignacio] TO [pepe]
GO

CREATE procedure [dbo].[impersonal]
as
begin
	-- Pepe asumirá temporalmente el contexto de ejecución de [DIRECCION\Ignacio]
	EXECUTE AS LOGIN = 'DIRECCION\ignacio';

	-- pepe crea el nuevo login
	CREATE LOGIN ramiro WITH PASSWORD = '111222333';

	-- Revierte el anterior contexto de ejecución.
	REVERT;
end

-- concedemos el permiso EXECUTE sobre el procedimiento a pepe
GRAN EXECUTE ON [dbo].[impersonal]  TO pepe

-- El usuario pepe ejecuta el procedimiento almacenado
exec impersonal