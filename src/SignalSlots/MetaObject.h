//
// Created by Graham Hill on 2024/12/15.
//

#ifndef METAOBJECT_H
#define METAOBJECT_H

#include <string>
#include <map>
#include <iostream>

#include "Signals.h"

class MetaObject {
protected:
    std::map<std::string, Signal> signals;

public:
    virtual ~MetaObject() = default;

    [[nodiscard]] virtual const char* className() const = 0;

    void registerSignal(const std::string& name);

    void registerSignalHelper(const std::initializer_list<std::string>& names);

    void emitSignal(const std::string& name);

    Signal& getSignal(const std::string& name);
};




#endif //METAOBJECT_H
