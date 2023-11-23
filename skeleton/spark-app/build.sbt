name := "spark-app"
version := "0.0.0"
scalaVersion := "2.11.12"

libraryDependencies ++= Seq(
  "org.apache.spark" %% "spark-sql" % "2.4.5" % "provided"
)

assemblyJarName := s"spark-app-${version.value}.jar"
