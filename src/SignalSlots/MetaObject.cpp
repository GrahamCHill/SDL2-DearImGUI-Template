//
// Created by Graham Hill on 2024/12/15.
//

#include "MetaObject.h"

void MetaObject::registerSignal(const std::string& name){
    signals[name];  // Create the signal entry
}

void MetaObject::registerSignalHelper(const std::initializer_list<std::string>& names) {
    for (const auto& name : names) {
        registerSignal(name);
    }
}

void MetaObject::emitSignal(const std::string &name) {
    if (const auto it = signals.find(name); it != signals.end()) {
        it->second.emit();
    } else {
        std::cerr << "Signal " << name << " not found in " << className() << ".\n";
    }
}

Signal & MetaObject::getSignal(const std::string &name) {
    return signals[name];  // Ensure creation
}

