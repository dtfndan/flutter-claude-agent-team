#!/bin/bash
# SessionStart: detect fresh projects and missing artifacts so we can nudge
# the user toward the right skill.
HAS_PUBSPEC=0; HAS_LIB=0; HAS_PLAN=0; HAS_PLAN_FILLED=0; HAS_FIREBASE=0
[ -f pubspec.yaml ] && HAS_PUBSPEC=1
[ -d lib ] && HAS_LIB=1
[ -f PLAN.md ] && HAS_PLAN=1
[ -f firebase.json ] && HAS_FIREBASE=1
if [ -f PLAN.md ] && [ $(wc -c < PLAN.md 2>/dev/null || echo 0) -gt 200 ]; then
    HAS_PLAN_FILLED=1
fi

echo "=== Gap Detector ==="

if [ "$HAS_PUBSPEC" -eq 0 ] && [ "$HAS_LIB" -eq 0 ]; then
    echo "• No Flutter project detected. Run /start to onboard, or /setup-flutter to bootstrap."
elif [ "$HAS_PLAN" -eq 1 ] && [ "$HAS_PLAN_FILLED" -eq 0 ]; then
    echo "• PLAN.md exists but is empty. Start with /design or /arch to fill it in."
fi

if [ "$HAS_LIB" -eq 1 ] && [ "$HAS_FIREBASE" -eq 0 ]; then
    echo "• Flutter code exists but no firebase.json — run /backend when you're ready."
fi

if [ "$HAS_LIB" -eq 1 ]; then
    COUNT_TESTS=$(find test integration_test -type f -name "*_test.dart" 2>/dev/null | wc -l)
    COUNT_SRC=$(find lib -type f -name "*.dart" 2>/dev/null | wc -l)
    if [ "$COUNT_SRC" -gt 20 ] && [ "$COUNT_TESTS" -lt 3 ]; then
        echo "• $COUNT_SRC source files but only $COUNT_TESTS tests. Consider /qa or /widget-test."
    fi
fi

if [ -f android/app/build.gradle ] || [ -f android/app/build.gradle.kts ]; then
    if ! grep -qE 'minifyEnabled\s+true|isMinifyEnabled\s*=\s*true' android/app/build.gradle* 2>/dev/null; then
        echo "• Android release build has no minification. Run /deploy before shipping."
    fi
fi

echo "===================="
exit 0
