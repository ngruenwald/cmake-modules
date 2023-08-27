#include <iostream>
#include "resources.h"

#include <argparse/argparse.hpp>
#include <backward.hpp>
#include <catch2/catch_test_macros.hpp>
#include <common/arguments.hpp>
#include <common/result.hpp>
#include <cxxopts.hpp>
#include <fmt/core.h>
//#include <httplib.h>
#include <nlohmann/json.hpp>
#include <inja/inja.hpp>
#include <archive.h>
#include <git2/repository.h>
#include <lyra/lyra.hpp>
#include <pugixml.hpp>
//#include <spdlog/spdlog.h>
#include <tempus/timer_queue.hpp>
#include <toml.hpp>
#include <yaml-cpp/yaml.h>
#include <zlib.h>
#include <re.h>


/// Main function
/// @param[in] args Command line arguments
/// @returns Result containing an error code if not ok.
cmn::Result<void, int> Main(
    const cmn::Arguments& args)
{
    std::cout << README_md_data << '\n' << '\n';
    std::cout << "size: " << README_md_size << " bytes" << '\n';
    return 0;
}

int main(int argc, char** argv)
{
    auto result = Main(cmn::Arguments::from_args(argc, argv));
    return !result.is_ok() ? result.error() : 0;
}
