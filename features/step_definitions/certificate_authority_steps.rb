Lorsqu(/^il créé une autorité de certification "(.*?)"$/) do |arg1|
  visit user_omniauth_authorize_path(:medispo)

  click_link 'New Authority'
  fill_in 'Name', with: arg1
  fill_in 'Basename', with: arg1
  click_button 'Save'

  @authority = Authority.last
  @authority.should_not be_nil
  @authority.name.should == arg1
end

Alors(/^l'autorité de certification "(.*?)" peut de signer des demandes de signatures de certificats$/) do |arg1|
  @authority = Authority.find_by_name(arg1)

  key = OpenSSL::PKey::RSA.new(2048)

  csr = OpenSSL::X509::Request.new
  csr.version = 2
  csr.public_key = key.public_key
  csr.subject = OpenSSL::X509::Name.parse('/C=FR/O=ACME/OU=Road Runner/CN=Wile E Coyote/emailAddress=coyote@example.com')
  csr.sign(key, OpenSSL::Digest::SHA256.new)

  @authority.sign(csr)
end
