#!/bin/bash
set -e -o pipefail

# Make sure you update the pom.xml, too!
TCHIR_VERSION="v2.1.0-dev"

if [ -z "$TCHIR_NAME" ] || [ -z "$TCHIR_HOME" ] || [ -z "$TCHIR_VERSION" ] || [ -z "$TCHIR_BASE_URL" ]; then
	echo "You're calling build.sh without any of the required environment variables."
	echo "Did you mean to run bokutachi.sh or bokutachi-staging.sh? (You did)"
	exit 1;
fi

echo "BUILDING: $TCHIR_NAME $TCHIR_HOME $TCHIR_VERSION $TCHIR_BASE_URL"

# Compile time variables in java are near impossible
# And i cannot stand dependency injection.
# Am i going to hell for reinventing the C preprocessor poorly?
# Probably.

JAVA_LOC='./src/main/java/bms/player/beatoraja/ir/TachiIR.java'

# Overwrite strings with our vars
sed -i "s|\${tachi.name}|$TCHIR_NAME|" "$JAVA_LOC"
sed -i "s|\${tachi.home}|$TCHIR_HOME|" "$JAVA_LOC"
sed -i "s|\${tachi.version}|$TCHIR_VERSION|" "$JAVA_LOC"
sed -i "s|\${tachi.baseUrl}|$TCHIR_BASE_URL|" "$JAVA_LOC"

# Compile
mvn compile assembly:single

# Reset everything to what it was
sed -i "s|public static final String NAME =.*;|public static final String NAME = \"\${tachi.name}\";|" "$JAVA_LOC"
sed -i "s|public static final String HOME =.*;|public static final String HOME = \"\${tachi.home}\";|" "$JAVA_LOC"
sed -i "s|public static final String VERSION =.*;|public static final String VERSION = \"\${tachi.version}\";|" "$JAVA_LOC"
sed -i "s|private static final String BASE_URL =.*;|private static final String BASE_URL = \"\${tachi.baseUrl}\";|" "$JAVA_LOC"

# Optional 4th step: cry