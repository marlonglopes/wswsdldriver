class WsconsomeController < ApplicationController

require 'soap/wsdlDriver'

WSDL = "http://workflow.ghc.com.br/wsghcworkflow/WSGHCWorkflow.asmx?WSDL"

@@soap ||= SOAP::WSDLDriverFactory.new(WSDL).create_rpc_driver

def index



response = @@soap.GHCGenericFunction(:id => '0', :param => 'param^param')
@@soap.reset_stream
 
render :text=> response.gHCGenericFunctionResult


end


end



