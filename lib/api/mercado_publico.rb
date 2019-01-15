# frozen_string_literal: true

module Api
  # class to manage mercadopublico.cl API
  class MercadoPublico
    include HTTParty

    base_uri 'http://api.mercadopublico.cl'

    ITEMS = [
      '43191500',
      '43191600',
      '43201400',
      '43201500',
      '43211500',
      '43221500',
      '43221600',
      '43221800',
      '43223200',
      '43231500',
      '43232300',
      '43232400',
      '43232700',
      '43232900',
      '43233000',
      '43233400',
      '55111500',
      '81111700',
      '83111600',
      '83121700',
      '86101700',
      '86111600',
      '86111700',
      '86111800',
      '86121500',
      '86121600',
      '86121800',
      '86131500',
      '86131600',
      '86131800',
      '86131900',
      '93131500',
      '94101600',
      '94111900'
    ]

    def response_ex
      {
        "Cantidad": 1,
        "FechaCreacion": "2019-01-15T15:26:35.473",
        "Version": "v1",
        "Listado": [
            {
                "CodigoExterno": "1778-2-LE19",
                "Nombre": "Servicios profesionales de enfermeras/os Bio Bio",
                "CodigoEstado": 5,
                "Descripcion": "Servicios profesionales de enfermeras/os o enfermeras/os Región del Biobío ",
                "FechaCierre": null,
                "Estado": "Publicada",
                "Comprador": {
                    "CodigoOrganismo": "6953",
                    "NombreOrganismo": "Instituto de Seguridad Laboral - ISL",
                    "RutUnidad": "61.533.000-0",
                    "CodigoUnidad": "2774",
                    "NombreUnidad": "ISL - Nivel Central",
                    "DireccionUnidad": "Rosas N° 1309, Santiago",
                    "ComunaUnidad": "Santiago Centro",
                    "RegionUnidad": "Región del Biobío ",
                    "RutUsuario": "12.275.664-5",
                    "CodigoUsuario": "1162464",
                    "NombreUsuario": "Rodrigo Garcia Diaz",
                    "CargoUsuario": "Departamento de Administración"
                },
                "DiasCierreLicitacion": "10",
                "Informada": 0,
                "CodigoTipo": 1,
                "Tipo": "LE",
                "TipoConvocatoria": "1",
                "Moneda": "CLP",
                "Etapas": 1,
                "EstadoEtapas": "0",
                "TomaRazon": "0",
                "EstadoPublicidadOfertas": 1,
                "JustificacionPublicidad": "",
                "Contrato": "1",
                "Obras": "0",
                "CantidadReclamos": 54,
                "Fechas": {
                    "FechaCreacion": "2019-01-14T00:00:00",
                    "FechaCierre": "2019-01-25T15:00:00",
                    "FechaInicio": "2019-01-14T16:00:00",
                    "FechaFinal": "2019-01-21T10:00:00",
                    "FechaPubRespuestas": "2019-01-23T17:00:00",
                    "FechaActoAperturaTecnica": "2019-01-25T16:00:00",
                    "FechaActoAperturaEconomica": "2019-01-25T16:00:00",
                    "FechaPublicacion": "2019-01-14T14:34:34.847",
                    "FechaAdjudicacion": "2019-05-27T17:00:00",
                    "FechaEstimadaAdjudicacion": "2019-05-27T17:00:00",
                    "FechaSoporteFisico": null,
                    "FechaTiempoEvaluacion": null,
                    "FechaEstimadaFirma": null,
                    "FechasUsuario": "1900-01-03T00:00:00",
                    "FechaVisitaTerreno": null,
                    "FechaEntregaAntecedentes": null
                },
                "UnidadTiempoEvaluacion": 1,
                "DireccionVisita": "",
                "DireccionEntrega": "",
                "Estimacion": 1,
                "FuenteFinanciamiento": "INSTITUTO DE SEGURIDAD LABORAL",
                "VisibilidadMonto": 1,
                "MontoEstimado": 43050000,
                "Tiempo": "24",
                "UnidadTiempo": "1",
                "Modalidad": 1,
                "TipoPago": "1",
                "NombreResponsablePago": "Daniela Gutierrez Alvarez",
                "EmailResponsablePago": "dgutierreza@isl.gob.cl",
                "NombreResponsableContrato": "Daniela Gutierrez Alvarez",
                "EmailResponsableContrato": "dgutierreza@isl.gob.cl",
                "FonoResponsableContrato": "56-02-23937-600",
                "ProhibicionContratacion": "Según lo señalado en el punto 12.5 de las Bases de Licitación",
                "SubContratacion": "1",
                "UnidadTiempoDuracionContrato": 1,
                "TiempoDuracionContrato": "24",
                "TipoDuracionContrato": " ",
                "JustificacionMontoEstimado": "Conforme a punto 11.3 Vigencia y monto de la contratación",
                "ObservacionContract": null,
                "ExtensionPlazo": 0,
                "EsBaseTipo": 0,
                "UnidadTiempoContratoLicitacion": "2",
                "ValorTiempoRenovacion": "0",
                "PeriodoTiempoRenovacion": " ",
                "EsRenovable": 0,
                "Adjudicacion": null,
                "Items": {
                    "Cantidad": 1,
                    "Listado": [
                        {
                            "Correlativo": 1,
                            "CodigoProducto": 85101601,
                            "CodigoCategoria": "85101600",
                            "Categoria": "Salud, servicios sanitarios y alimentación / Servicios para el cuidado de la salud de las personas / Enfermería y paramédicos",
                            "NombreProducto": "Servicios de enfermería",
                            "Descripcion": "Servicios profesionales de enfermeras/os o enfermeras/os matrón/as, para Región del Biobío y otras regiones",
                            "UnidadMedida": "Unidad",
                            "Cantidad": 1,
                            "Adjudicacion": null
                        }
                    ]
                }
            }
        ]
    }
    end

    def initialize
      @options = { query: { ticket: api_key } }
      @items = Api::MercadoPublico::ITEMS
    end

    def api_key
      ENV['API_TICKET']
    end

    def base_path
      '/servicios/v1/publico/'
    end

    # to get purchase orders

    def orders
      url = "#{base_path}/ordenesdecompra.json"
      self.class.get(url, @options)
    end

    def biddings
      url = "#{base_path}/licitaciones.json?estado=publicada"
      self.class.get(url, @options)['Listado']
    end

    def bidding_detail(bidding_id)
      url = "#{base_path}/licitaciones.json?codigo=#{bidding_id}"
      self.class.get(url, @options)['Listado']
    end

    def bidding_states(state)
      case state
      when 5
        "<small class='label bg-green'>Publicada</small>".html_safe
      when 6
        "<small class='label bg-red'>Cerrada</small>".html_safe
      when 7
        "<small class='label bg-red'>Desierta</small>".html_safe
      when 18
        "<small class='label bg-red'>Adjudicada</small>".html_safe
      when 19
        "<small class='label bg-red'>Suspendida</small>".html_safe
      end
    end

    # we suggest you do not use this method, to much http requests :( 

    def process_biddings
      instance = Api::MercadoPublico.new
      arr = []
      biddings = instance.biddings
      biddings.each do |bidding|
        sleep 2
        detail = instance.bidding_detail(bidding['CodigoExterno'])
        if Api::MercadoPublico::ITEMS.include?(detail['Listado'][0]['Items']['Listado'][0]['CodigoCategoria'])
          arr << detail['Listado'][0]
        end
      end
      arr
    end
  end
end
