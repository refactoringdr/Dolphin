"Filed out from Dolphin Smalltalk X6.1"!

WriteStream subclass: #SocketWriteStream
	instanceVariableNames: 'socket dirty'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
SocketWriteStream guid: (GUID fromString: '{87B4C6FE-026E-11D3-9FD7-00A0CC3E4A32}')!
SocketWriteStream comment: 'This class represents a buffered write stream for sending data across a Socket connection.

From an implementation perspective this class is similar to FileStream, in that it uses the inherited stream collection as a buffer, overridding certain operations to note when the buffer is dirty. Data is not sent to the underlying socket until the stream is explictily flushed, or the buffer overflows.'!
!SocketWriteStream categoriesForClass!Collections-Streams!Windows Sockets! !
!SocketWriteStream methodsFor!

close
	"Write any outstanding changes to the socket and close it."

	self flush.
	socket close.
	socket := nil!

flush
	"Flush any buffered modifications to the socket."

	dirty ifFalse: [^self].
	socket send: collection count: position.
	position := 0.
	dirty := false!

growCollection
	"Private - The buffer of a FileStream is fixed at the page size."

	^self shouldNotImplement!

initialize
	"Private - Initialise the new instance."

	dirty := false.
	super initialize!

isBinary
	"Answer whether the receiver's data is binary (i.e. consisting of Integers in the range 0..255)."

	^self collection isMemberOf: ByteArray!

isText
	"Answer whether if the receiver's data is characters"

	^self isBinary not!

isText: aBoolean 
	"Set whether the elements of the receiver should be treated as bytes (Integers)
	or characters.."

	collection := aBoolean ifTrue: [collection asString] ifFalse: [collection asByteArray]!

next: sizeInteger putAll: aSequenceableCollection startingAt: startInteger 
	"Append countInteger elements of aSequenceableCollection from startInteger
	to the receiver. Answer aSequenceableCollection."

	| stop |
	stop := position + sizeInteger.
	stop <= writeLimit 
		ifTrue: 
			["The block fits into the current collection and can be
			written directly"
			collection 
				replaceFrom: position + 1
				to: stop
				with: aSequenceableCollection
				startingAt: startInteger.
			position := stop.
			dirty := true]
		ifFalse: 
			["The block will not fit within the current collection."
			self flush.
			self socket 
				send: aSequenceableCollection
				count: sizeInteger
				startingAt: startInteger].
	^aSequenceableCollection!

nextPut: anInteger 
	"Write anIntegerOrCharacter to the receiver and answer the argument."

	dirty := true.
	^self primitiveNextPut: anInteger!

nextPutAll: aCollection
	"Store the elements in the argument, aCollection, as the next elements accessible by the receiver. 
	Answer aCollection"

	^aCollection appendToStream: self!

primitiveNextPut: anInteger 
	"Private - Write anInteger to the receiver."

	<primitive: 66>
	self flush.
	dirty := true.
	^collection at: (position := position + 1) put: anInteger!

socket
	"Private - Answers the socket instance variable."

	^socket!

socket: aSocket 
	"Private - Sets the socket instance variable to aSocket."

	socket := aSocket! !
!SocketWriteStream categoriesFor: #close!operations!public! !
!SocketWriteStream categoriesFor: #flush!buffer!public! !
!SocketWriteStream categoriesFor: #growCollection!operations!private! !
!SocketWriteStream categoriesFor: #initialize!initializing!private! !
!SocketWriteStream categoriesFor: #isBinary!public!testing! !
!SocketWriteStream categoriesFor: #isText!public!testing! !
!SocketWriteStream categoriesFor: #isText:!modes!public! !
!SocketWriteStream categoriesFor: #next:putAll:startingAt:!accessing!public! !
!SocketWriteStream categoriesFor: #nextPut:!accessing!public! !
!SocketWriteStream categoriesFor: #nextPutAll:!accessing!public! !
!SocketWriteStream categoriesFor: #primitiveNextPut:!accessing!private! !
!SocketWriteStream categoriesFor: #socket!accessing!private! !
!SocketWriteStream categoriesFor: #socket:!accessing!private! !

!SocketWriteStream class methodsFor!

bufferSize
	"Answer the size of the buffer to be used."

	^4096!

on: aSocket 
	"Answers a new instance of the receiver for communicating with aSocket."

	^self on: aSocket text: false!

on: aSocket text: aBoolean 
	"Answer a new instance of the receiver on the specified <Socket>, to be used for buffered writing 
	string or binary data to that socket depending on the value of <boolean> argument."

	^(self basicNew)
		socket: aSocket;
		collection: ((aBoolean ifTrue: [String] ifFalse: [ByteArray]) newFixed: self bufferSize);
		initialize;
		yourself! !
!SocketWriteStream class categoriesFor: #bufferSize!constants!public! !
!SocketWriteStream class categoriesFor: #on:!instance creation!public! !
!SocketWriteStream class categoriesFor: #on:text:!instance creation!public! !

