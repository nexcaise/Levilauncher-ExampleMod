#include <jni.h>
#include <pl/Mod.h>
#include <pl/api/Macro.h>
#include <pl/Logger.h>

PLCAPI void LeviMod_Load(JavaVM* vm, Mod mod) {
    auto& logger = pl::log::Logger::getOrCreate("Example Mod");
    logger.info("Mod {} Active", mod.getFileName());
};