plugins {
    `kotlin-dsl`
}

repositories {
    gradlePluginPortal()
}

dependencies {
    implementation(libs.kotlin.gradle.plugin)
    implementation(libs.spring.boot.plugin)
    implementation(files(libs.javaClass.superclass.protectionDomain.codeSource.location))
}
