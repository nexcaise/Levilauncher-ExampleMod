set_project("example_mod")
set_version("1.0.0")

set_languages("c99", "cxx23")

add_rules("mode.release")

add_repositories("xmake-repo https://github.com/xmake-io/xmake-repo.git")
-- add_repositories("levimc-repo https://github.com/LiteLDev/xmake-repo.git")
-- waiting for dreamguxiang to release the latest version on xmake-repo
add_repositories("levimc-repo https://github.com/nexcaise/xmake-repo.git")

add_requires("fmt")
add_requires("preloader_android")

target("example_mod")
    set_kind("shared")
    add_files("src/**.cpp")
    add_files("src/**.c")
    add_headerfiles("src/**.hpp")
    add_headerfiles("src/**.h")
    add_includedirs("src", {public = true})
    add_packages("preloader_android", "fmt")
    add_links("log")