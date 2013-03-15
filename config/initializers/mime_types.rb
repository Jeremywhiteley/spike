# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
Mime::Atom = Mime::Type.lookup_by_extension(:atom)
Mime::Type.register "application/opensearchdescription+xml", :opensearchdescription
Mime::Type.register "application/vnd.mitre.pdmp.2+xml", :pdmp2
Mime::Type.register "application/vnd.ncpdp.script.10+xml", :ncpdpscript
