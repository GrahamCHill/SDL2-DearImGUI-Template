//
// Created by Graham Hill on 2024/12/15.
//

#include "Signals.h"


void Signal::connect(const Slot& slot) {
        slots.push_back(slot);

}

void Signal::emit() const {
    for (auto& slot : slots) {
        slot();
    }
}
