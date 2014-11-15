#ifndef EXAMPLEPLUGIN_H
#define EXAMPLEPLUGIN_H
#include "plugin-interface/plugin.h"

class ExamplePlugin : public Plugin
{
public:
    ExamplePlugin();

    virtual ~ExamplePlugin();

    virtual void onDisable() override;
    virtual void onEnable() override;
};

#endif // EXAMPLEPLUGIN_H
