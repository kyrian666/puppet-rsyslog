require 'spec_helper'
require 'yaml'

describe 'rsyslog::component::action' do
  let(:title) { 'myaction' }

  context 'string action' do
    let(:params) { {
      :type     => 'omelasticsearch',
      :priority => 40,
      :target   => '50_rsyslog.conf',
      :config   => {
        "queue.type"           => "linkedlist",
        "queue.spoolDirectory" => "/var/log/rsyslog/queue",
      }
    }}

    it do
      is_expected.to contain_concat__fragment('rsyslog::component::action::myaction').with_content(
        /(?x)# myaction\n
        \s*action\(type="omelasticsearch"\s*\n
        \s+queue\.type="linkedlist"\s*\n
        \s+queue\.spoolDirectory="\/var\/log\/rsyslog\/queue"\s*\n
        \s*\)\s*/)
    end
  end

end
    

