# Various Protocols with a 3rd grade explanation and typical ports

## [TelNet](https://en.wikipedia.org/wiki/Telnet) Port: 23

- Old way to send data over the internet, plain text for everyone to see.
- It's like yelling across the lunch room knowing that anyone in the cafeteria can listen in and clearly understand what you are saying.

## [SSH](https://en.wikipedia.org/wiki/Secure_Shell) Port: 22

- Way more secure way to transmit data from one computer to another because of encryption.  SSH secures access to a computer, public key is used to encrypt a message and private key decifers it.
    1. Public key is on the ssh server and private key on client locally.
    1. Client sends a request using an id of the key pair it wants to use to prove its identity.
    1. Server sends a challenge encrypted with public key.
    1. Client decrypts with private key and sends it back to be verified.
    1. Connection established and you're good to go.
- I want to talk to Richard but don't want anyone else to hear what i'm saying. I set up a secret handshake where he completes the first half of the handshake by dancing around in a circle 3 times and whispers "birds".  Once I hear the word "birds" I jump up and down 4 times and reply with whispering "boogers" derived by our super secret language, back to him. Now we both know we can trust each other and no one else can understand what we're saying in our secret language.