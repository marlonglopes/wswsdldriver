require 'soap/wsdlDriver'

class WsconsomeController < ApplicationController

#	WSDL = "http://workflow.ghc.com.br/wsghcworkflow/WSGHCWorkflow.asmx?WSDL"
#	WSDL = "http://130.158.1.41/WSGHCWorkflow/WSGHCWorkflow.asmx?WSDL"

	def index
 		soap = wsdl.create_rpc_driver
#		soap ||= SOAP::WSDLDriverFactory.new(WSDL).create_rpc_driver
		response = soap.GHCGenericFunction(:id => '11', :param => 'param^param')
		soap.reset_stream
		render :text=> response.gHCGenericFunctionResult
	end


 private
    def wsdl
      SOAP::WSDLDriverFactory.new("http://130.158.1.41/WSGHCWorkflow/WSGHCWorkflow.asmx?WSDL")
    end

end



