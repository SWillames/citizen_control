$(document).ready(function() {
    $('.cep').mask('00000-000');
    function limpa_formulário_cep() {
        
        $("#citizen_address_attributes_street").val("");
        $("#citizen_address_attributes_district").val("");
        $("#citizen_address_attributes_city").val("");
        $("#citizen_address_attributes_UF").val("");
        $("#citizen_address_attributes_ibge").val("");
    }

    
    $("#citizen_address_attributes_zip_code").blur(function() {

        var cep = $(this).val().trim();
    
        if (cep && cep.length === 9 ) {

            loadingFieldsCep();

            $.getJSON(`https://viacep.com.br/ws/${cep}/json/`, function(dados) {

                if (dados?.cep) {
                    $("#citizen_address_attributes_street").val(dados.logradouro);
                    $("#citizen_address_attributes_district").val(dados.bairro);
                    $("#citizen_address_attributes_city").val(dados.localidade);
                    $("#citizen_address_attributes_UF").val(dados.uf);
                    $("#citizen_address_attributes_ibge").val(dados.ibge);
                } 
                else {
                    limpa_formulário_cep();
                    alert("CEP não encontrado.");
                }
            });

        }else {
            limpa_formulário_cep();
        }
    });

    function loadingFieldsCep(){
        $("#citizen_address_attributes_street").val("...");
        $("#citizen_address_attributes_district").val("...");
        $("#citizen_address_attributes_city").val("...");
        $("#citizen_address_attributes_UF").val("...");
        $("#citizen_address_attributes_ibge").val("...");
    }
});