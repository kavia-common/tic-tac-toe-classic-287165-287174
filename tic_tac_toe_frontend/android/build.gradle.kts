allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

/**
 * Note: ndkVersion is pinned in :app/build.gradle.kts to 27.0.12077973
 * to ensure Gradle uses a consistent NDK for all plugins requiring NDK 27.
 */

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
