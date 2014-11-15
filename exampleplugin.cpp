#include "exampleplugin.h"

ExamplePlugin::ExamplePlugin() :
    Plugin("Plugin interface example", "org.samcrow.examples.plugin_interface", "Example plugin for the C++ plugin interface")
{
    debug("Example plugin starting");
}


void ExamplePlugin::onStop()
{
    debug("Example plugin stopping");
}

void ExamplePlugin::onDisable()
{
    debug("Example plugin disabling");
}

void ExamplePlugin::onEnable()
{
    debug("Example pugin enabling");
}
