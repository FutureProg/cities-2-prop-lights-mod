all: build
BEPINEX_VERSION = 5

clean:
	@dotnet clean PropLightsMod.csproj

restore:
	@dotnet restore PropLightsMod.csproj

build: clean restore
	@dotnet build PropLightsMod.csproj /p:BepInExVersion=$(BEPINEX_VERSION)

run: 
	E:\SteamLibrary\steamapps\common\Cities Skylines II\Cities2.exe -developerMode

package-thunderstore: build	
	@cmd /c copy /y "bin\Debug\netstandard2.1\0Harmony.dll" "thunderstore\"
	@cmd /c copy /y "bin\Debug\netstandard2.1\PropLightsMod.dll" "thunderstore\"
	@echo Packaged to thunderstore/

package-win: build
	@-mkdir dist
	@cmd /c copy /y "bin\Debug\netstandard2.1\0Harmony.dll" "dist\"
	@cmd /c copy /y "bin\Debug\netstandard2.1\PropLightsMod.dll" "dist\"
	@echo Packaged to dist/

package-unix: build
	@-mkdir dist
	@cp bin/Debug/netstandard2.1/0Harmony.dll dist
	@cp bin/Debug/netstandard2.1/PropLightsMod.dll dist
	@echo Packaged to dist/