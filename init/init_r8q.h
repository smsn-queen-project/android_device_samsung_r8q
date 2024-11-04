#ifndef INIT_SEC_H
#define INIT_SEC_H

#include <string.h>

enum device_variant {
    VARIANT_G780G = 0,
    VARIANT_G7810,
    VARIANT_G781B,
    VARIANT_G781N,
    VARIANT_MAX
};

typedef struct {
    std::string model;
    std::string codename;
} variant;

static const variant international_models = {
    .model = "SM-G780G",
    .codename = "r8q"
};

static const variant chn_models = {
    .model = "SM-G7810",
    .codename = "r8q"
};

static const variant international_models_5g = {
    .model = "SM-G781B",
    .codename = "r8q"
};

static const variant kor_models = {
    .model = "SM-G781N",
    .codename = "r8q"
};

static const variant *all_variants[VARIANT_MAX] = {
    &international_models,
    &international_models_5g,
    &chn_models,
    &kor_models,
};

#endif // INIT_SEC_H
