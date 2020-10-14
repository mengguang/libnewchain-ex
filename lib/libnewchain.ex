defmodule LibNewChain do
  @on_load { :init, 0 }

  app = Mix.Project.config[:app]

  def init do
    path = :filename.join(:code.priv_dir(unquote(app)), 'libnewchain_nif')
    :ok = :erlang.load_nif(path, 0)
  end


  def newchain_recover_public_key_ex(_message_hash,_signature,_v) do
    raise "NIF newchain_recover_public_key_ex/3 not implemented"
  end
end

