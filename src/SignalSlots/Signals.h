//
// Created by Graham Hill on 2024/12/15.
//

#ifndef SIGNALSYSTEM_H
#define SIGNALSYSTEM_H

#include <functional>
#include <vector>

#define MY_OBJECT(cls, ...)                                     \
public:                                                         \
static const char* staticClassName() { return #cls; }           \
virtual const char* className() const override { return #cls; } \
private:                                                        \
void registerSignals() { registerSignalHelper({__VA_ARGS__}); } \
void dummy()
  // Avoid extra semicolons


class Signal {
public:
    using Slot = std::function<void()>;

    void connect( const Slot& slot);

    void emit() const;

private:
    std::vector<Slot> slots;
};


#endif //SIGNAL_H
