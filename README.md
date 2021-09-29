# Tachi Beatoraja IR
This is the Tachi Internet Ranking implementation for Beatoraja.

## Downloads

Check the sidebar. When a new version of this is created, `.jar` files will be compiled for you and available there.

## Setup

You should create a beatoraja API key using <TODO>.
You should put your beatoraja API key into the password field. The username field is ignored, but you can fill it anyway.

## Troubleshooting

Tachi only explicitly supports `lr2oraja`, since LR2 is the standard for what players play on.
As such, this binary **WILL CLOSE THE GAME** if it detects it is running in normal beatoraja.

## Compiling

- Copy the relevant build of `beatoraja.jar` into `external/beatoraja.jar`.
- Set the TCHIR_HOME, TCHIR_NAME and TCHR_BASE_URL environment variables to what they need to be.
- Use `mvn compile assembly:single`. This will compile it into a single transferable `.jar` file. 

## Acknowledgements

The baseline for this implementation was provided by [Seraphin-](https://github.com/Seraphin-).
