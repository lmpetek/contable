#$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
 require 'prawn'
 Prawn::Document.generate('hello.pdf') do |pdf|
   pdf.text("Hello Prawn!")
 end