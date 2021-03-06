Reference

Parameters

dtype
This parameter is a string naming the hashing algorithm to use for a digest operation. The list of supported algorithms may change with each version of the OpenSSL library. Refer to the OpenSSL documentation for a complete and up to date list. As of 0.9.7, the supported types are:
md5
md4
md2
sha1
sha
mdc2
ripemd160
The list of supported hashing algorithms can also be retrieved by using the crypto.list("digests").
ktype
A string representing public/private key type. Can be "rsa" or "dsa".
cipher
This parameter is a string naming the cipher algorithm used by encryption and decryption. The list of supported hashing algorithms can also be retrieved by using the crypto.list("ciphers").
key
The string key/password used for encryption/decryption.
iv
An optional string initialization vector for encryption/decryption. It has to be of correct size (usually block size), otherwise the functions return an error.
pad
An optional boolean flag whether padding should be used. The default is true, which means that input of any size can be provided. Returned date may be larger than input string due to the padding. If explicitly set to false, the padding is turned off and the input data size has to be multiple of block length.
Error handling

The functions throw an error when known invalid parameters are passed, such as nonexistent digest/cipher and too large key or initialization vector. Otherwise, the functions return nil, error in case of runtime errors, such as incorrect input size when padding is enabled.
Message Digest - crypto.digest

Functions used to calculate cryptographic hashes of strings. Supported digest algorithms are returned by crypto.list("digests").

crypto.digest(dtype, string [, raw])
This function generates the message digest of the input string and returns it. The hashing algorithm to use is specified by dtype. The optional raw flag, defaulted to false, is a boolean indicating whether the output should be a direct binary equivalent of the message digest, or formatted as a hexadecimal string (the default).
crypto.digest.new(dtype)
Creates a new message digest object using the algorithm specified by dtype.
digest:reset()
Resets the EVP message digest object to a clean slate.
digest:clone()
Returns a new message digest object which is a clone of the object and its current state, including any data loaded to this point.
digest:update(string)
Appends the data in string to the current internal data set to be hashed. Returns the object so that it can be reused in nested calls.
digest:final([string] [, raw])
Generates the message digest for the loaded data, optionally appending on new data provided by string prior to hashing. The optional raw flag, defaulted to false, is a boolean indicating whether the output should be a direct binary equivalent of the message digest, or formatted as a hexadecimal string (the default).
Encryption, decryption - crypto.encrypt, crypto.decrypt

A high-level API to encryption and decryption using ciphers. Supported ciphers can be detected by calling crypto.list("ciphers").

crypto.encrypt(cipher, input, key [, iv[, pad]])
This function encrypts the the input string and returns the result. The encryption algorithm to use is specified by cipher. Encryption key is specified by the key parameter and is required. The optional iv parameter specifies an optional initialization vector. If boolean pad is specified after iv, it determines whether padding will be used (on by default).
crypto.decrypt(cipher, input, key [, iv[, pad]])
This function decrypts the the input string and returns the result. The decryption algorithm to use is specified by cipher. Decryption key is specified by the key parameter and is required. The optional iv parameter specifies an optional initialization vector. If boolean pad is specified after iv, it determines whether padding will be used (on by default).
crypto.encrypt.new(cipher, key [, iv[, pad]])
Creates a new encryption object using the algorithm specified by cipher and encryption key key. Optionally, initialization vector iv may be specified, followed by pad argument.
encrypt:update(string)
Appends the data in string to the current internal data. Returns a string with encrypted data, which may be of zero length if less than a message block size of data is provided.
encrypt:final()
Finishes the encryption, and returns any leftover encrypted data as string if necessary (due to padding).
crypto.decrypt.new(cipher, key [, iv[, pad]])
Creates a new decryption object using the algorithm specified by cipher and decryption key key. Initialization vector iv may optionally be specified, followed by pad argument.
decrypt:update(string)
Appends the data in string to the current internal data. Returns a string with decrypted data, which may be of zero length if less than a message block size of data is provided.
decrypt:final()
Finishes the decryption, and returns a string with any leftover decrypted data.
Public keys - crypto.pkey

Functions to work with public and private keys.

crypto.pkey.generate(ktype, len)
Generates a new ktype ("rsa", "dsa") public/private key pair object of length len bits.
crypto.pkey.read(filename [, private])
Reads a public key from PEM file filename. If private is set, reads a private key instead.
crypto.pkey.from_pem(key [, private])
Reads a public key from PEM string key. If private is set, reads it as a private key instead.
pkey:write(publicfile, privatefile)
If publicfile is a string, writes the public key into PEM file publicfile. If privatefile is a string, writes the private key into PEM file privatefile.
pkey:to_pem([private])
Generates a PEM string representation of the public key. If private is set, generates a PEM string for the private key.
Signing, verifying - crypto.sign, crypto.verify

A high-level interface to digital signatures. A digest algorithm is used to calculate a hash of the data, which is then signed using a private key into a signature. The signature can be used to verify a message using a public key.

crypto.sign(dtype, string, privkey)
This function generates the message digest of the input string, signs it using the private key privkey and returns it as a raw binary string. The hashing algorithm to use is specified by dtype.
crypto.verify(dtype, string, sig, pubkey)
This function generates the message digest of the input string using digest dtype, and verifies it against signature sig using public key pubkey. Returns true if the message was verified correctly.
crypto.sign.new(dtype)
Creates a new signing object using the digest algorithm specified by dtype.
sign:update(string)
Appends the data in string to the current internal data set to be signed.
sign:final(privkey)
Generates the message digest for the loaded data and signs it using the private key privkey. The resulting signed hash is returned as a raw binary string.
crypto.verify.new(dtype)
Creates a new verifying object using the digest algorithm specified by dtype.
verify:update(string)
Appends the data in string to the current internal data set to be verified.
verify:final(sign, pubkey)
Generates the message digest for the loaded data and verifies it agains sig using the public key pubkey. Returns true if the message was verified correctly.
Sealing and opening - crypto.seal, crypto.open

A high-level interface to digital envelopes. They generate a random key and IV, and then envelope it by using public key encryption. Data can then be encrypted using this key.

envelope, ek, iv = crypto.seal(cipher, message, pubkey)
Seals a string message using cipher cipher and public key pubkey. Returns 3 string values: sealed message, the generated encryption key signed with public key and the initialization vector.
crypto.open(cipher, envelope, privkey, ek, iv)
Opens a sealed envelope using private key privkey, key ek and initialization vector iv. Returns the sealed message.
crypto.seal.new(cipher, pubkey)
Creates a new sealing object using the algorithm specified by cipher and a public key pubkey.
seal:update(string)
Appends the data in string to the current internal data. Returns a string with encrypted data, which may be of zero length if less than a message block size of data is provided.
seal:final()
Finishes the sealing and returns 3 values: any leftover encrypted data as string, followed by the encryption key and initialization vector.
crypto.open.new(cipher, privkey, ek, iv)
Creates a new opening object using the algorithm specified by cipher, private key privkey, encryption key ek and initialization vector iv.
open:update(string)
Appends the data in string to the current internal data. Returns a string with decrypted data, which may be of zero length if less than a message block size of data is provided.
open:final()
Finishes the opening, and returns leftover decrypted data as string.
HMAC - crypto.hmac

crypto.hmac.digest(dtype, string, key [, raw])
This function returns the HMAC of the string. The hashing algorithm to use is specified by dtype. The value provided in key will be used as the seed for the HMAC generation. The optional raw flag, defaulted to false, is a boolean indicating whether the output should be a direct binary equivalent of the HMAC or formatted as a hexadecimal string (the default).
crypto.hmac.new(dtype, key)
Creates a new HMAC object using the algorithm specified by type. The HMAC seed key to use is provided by key.
hmac:reset()
Resets the HMAC object to a clean slate.
hmac:clone()
Returns a new HMAC object which is a clone of the object and its current state, including data loaded to this point. DOES NOT WORK YET. Just returns a new pointer to the same object.
hmac:update(string)
Appends the data in string to the current internal data set to be hashed.
hmac:final([string] [, raw])
Generates the HMAC for the loaded data, optionally appending on new data provided by string prior to hashing. The optional raw flag, defaulted to false, is a boolean indicating whether the output should be a direct binary equivalent of the message digest or formatted as a hexadecimal string (the default). Note that you can only run this method once on an object; running it a second time will product a bogus HMAC because the internal state is irrecoverably destroyed after the first call.
Misc functions - crypto

crypto.list(type)
Returns a Lua table array of supported digests and ciphers (strings), depending on then type argument:
"ciphers" - returns list of ciphers supported by crypto.encrypt and crypto.decrypt
"digests" - returns list of digests supported by crypto.digest
crypto.hex(s)
Expects a string s and returns it encoded as hex string (lowercase).