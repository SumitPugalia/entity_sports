defmodule EntitySports.Requests do
  @mercid Application.fetch_env!(:entity_sports, :merchant_id)

  def create_order_payload(
        additional_info,
        amount,
        currency,
        customer_refid,
        subscription_refid,
        start_date,
        end_date,
        orderid,
        mandate_required,
        frequency,
        ru,
        override \\ %{}
      ) do
    order_payload(
      additional_info,
      amount,
      currency,
      customer_refid,
      subscription_refid,
      start_date,
      end_date,
      orderid,
      mandate_required,
      frequency,
      ru,
      override
    )
  end

  defp order_payload(
         additional_info,
         amount,
         currency,
         customer_refid,
         subscription_refid,
         start_date,
         end_date,
         orderid,
         "Y",
         frequency,
         ru,
         override
       ) do
    %{
      "additional_info" => additional_info,
      "amount" => amount,
      "currency" => currency,
      "device" => %{
        "init_channel" => "internet",
        "mac" => "11-AC-58-21-1B-AA",
        "imei" => "990000112233445",
        "user_agent" =>
          "Mozilla/5.0 (Windows NT 10.0; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0",
        "accept_header" => "text/html",
        "ip" => "52.66.219.25"
      },
      "mandate" => %{
        "mercid" => @mercid,
        "currency" => currency,
        "amount" => amount,
        "customer_refid" => customer_refid,
        "subscription_refid" => subscription_refid,
        "subscription_desc" => "Package",
        "start_date" => start_date,
        "end_date" => end_date,
        "frequency" => frequency,
        "amount_type" => "max",
        "recurrence_rule" => "after",
        "debit_day" => 1,
        "ru" => ru
      },
      "itemcode" => "DIRECT",
      "mercid" => @mercid,
      "order_date" => DateTime.utc_now() |> to_string,
      "orderid" => orderid,
      "ru" => ru,
      "mandate_required" => "Y"
    }
    |> Map.merge(override)
  end

  defp order_payload(
         additional_info,
         amount,
         currency,
         _customer_refid,
         _subscription_refid,
         _start_date,
         _end_date,
         orderid,
         "N",
         _frequency,
         ru,
         override
       ) do
    %{
      "additional_info" => additional_info,
      "amount" => amount,
      "currency" => currency,
      "device" => %{
        "init_channel" => "internet",
        "mac" => "11-AC-58-21-1B-AA",
        "imei" => "990000112233445",
        "user_agent" =>
          "Mozilla/5.0 (Windows NT 10.0; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0",
        "accept_header" => "text/html",
        "ip" => "52.66.219.25"
      },
      "itemcode" => "DIRECT",
      "mercid" => @mercid,
      "order_date" => DateTime.utc_now() |> to_string,
      "orderid" => orderid,
      "ru" => ru,
      "mandate_required" => "N"
    }
    |> Map.merge(override)
  end

  def get_transaction_payload_by_order_id(order_id) do
    %{
      "mercid" => @mercid,
      "orderid" => order_id
    }
  end

  def get_transaction_payload_by_txn_id(txn_id) do
    %{
      "mercid" => @mercid,
      "transactionid" => txn_id
    }
  end
end
