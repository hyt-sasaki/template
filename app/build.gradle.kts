plugins {
    id("template.kotlin-application-conventions")
}

dependencies {
    implementation(libs.spring.boot.web)
    runtimeOnly(libs.logstash.logback.encoder)
}

