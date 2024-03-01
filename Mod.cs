using System.Reflection;
using Colossal.Logging;
using Trejak.PropLightsMod.Systems;
using Game;
using Game.Modding;

namespace Trejak.PropLightsMod {

    public sealed class Mod : IMod
    {

        public static Mod Instance { get; private set; }

        internal ILog Log { get; private set; }

        public void OnLoad()
        {
            Instance = this;

            Log = LogManager.GetLogger("Trejak-PropLightsMod");

#if DEBUG
            Log.effectivenessLevel = Level.Debug;
#endif
            Log.Info($"loading CS2ModsTesting version {Assembly.GetExecutingAssembly().GetName().Version}");
        }

        public void OnCreateWorld(UpdateSystem updateSystem)
        {
            Log.Info("Starting On Create World");
            updateSystem.UpdateAt<PropLightingSystem>(SystemUpdatePhase.GameSimulation);
        }

        public void OnDispose()
        {
            Log.Info("Disposing");
            Instance = null;
        }
    }

}