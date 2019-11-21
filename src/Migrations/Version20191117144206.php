<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20191117144206 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE order_status_log CHANGE id_order_status_log id_order_status_log INT NOT NULL, CHANGE fk_order fk_order INT DEFAULT NULL');
        $this->addSql('ALTER TABLE vehicle_ecu_file CHANGE hash hash VARCHAR(255) DEFAULT \'NULL\'');
        $this->addSql('ALTER TABLE order_state CHANGE fk_order fk_order INT DEFAULT NULL');
        $this->addSql('ALTER TABLE service CHANGE fk_category fk_category INT DEFAULT NULL');
        $this->addSql('ALTER TABLE order_to_service DROP FOREIGN KEY fk_service_has_order_order1');
        $this->addSql('ALTER TABLE order_to_service DROP FOREIGN KEY fk_service_has_order_service1');
        $this->addSql('DROP INDEX fk_service_has_order_service1_idx ON order_to_service');
        $this->addSql('CREATE INDEX IDX_DCDF5A7211B2A7FE ON order_to_service (fk_service)');
        $this->addSql('DROP INDEX fk_service_has_order_order1_idx ON order_to_service');
        $this->addSql('CREATE INDEX IDX_DCDF5A7234C4B0ED ON order_to_service (fk_order)');
        $this->addSql('ALTER TABLE order_to_service ADD CONSTRAINT fk_service_has_order_order1 FOREIGN KEY (fk_order) REFERENCES `order` (id_order) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('ALTER TABLE order_to_service ADD CONSTRAINT fk_service_has_order_service1 FOREIGN KEY (fk_service) REFERENCES service (id_service) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('ALTER TABLE user CHANGE is_confirmed is_confirmed TINYINT(1) DEFAULT NULL, CHANGE is_admin is_admin TINYINT(1) NOT NULL');
        $this->addSql('ALTER TABLE `order` CHANGE fk_order_vehicle_data fk_order_vehicle_data INT DEFAULT NULL, CHANGE fk_user fk_user INT DEFAULT NULL');
        $this->addSql('ALTER TABLE order_to_vehicle_ecu_file DROP FOREIGN KEY fk_order_has_vehicle_ecu_file_order1');
        $this->addSql('ALTER TABLE order_to_vehicle_ecu_file DROP FOREIGN KEY fk_order_has_vehicle_ecu_file_vehicle_ecu_file1');
        $this->addSql('DROP INDEX fk_order_has_vehicle_ecu_file_order1_idx ON order_to_vehicle_ecu_file');
        $this->addSql('CREATE INDEX IDX_2360B0C634C4B0ED ON order_to_vehicle_ecu_file (fk_order)');
        $this->addSql('DROP INDEX fk_order_has_vehicle_ecu_file_vehicle_ecu_file1_idx ON order_to_vehicle_ecu_file');
        $this->addSql('CREATE INDEX IDX_2360B0C680786249 ON order_to_vehicle_ecu_file (fk_vehicle_ecu_file)');
        $this->addSql('ALTER TABLE order_to_vehicle_ecu_file ADD CONSTRAINT fk_order_has_vehicle_ecu_file_order1 FOREIGN KEY (fk_order) REFERENCES `order` (id_order) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('ALTER TABLE order_to_vehicle_ecu_file ADD CONSTRAINT fk_order_has_vehicle_ecu_file_vehicle_ecu_file1 FOREIGN KEY (fk_vehicle_ecu_file) REFERENCES vehicle_ecu_file (id_vehicle_ecu_file) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('ALTER TABLE order_vehicle_data CHANGE fk_vehicle_model fk_vehicle_model INT DEFAULT NULL');
        $this->addSql('ALTER TABLE vehicle_model CHANGE fk_vehicle_make fk_vehicle_make INT DEFAULT NULL');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE `order` CHANGE fk_order_vehicle_data fk_order_vehicle_data INT NOT NULL, CHANGE fk_user fk_user INT NOT NULL');
        $this->addSql('ALTER TABLE order_state CHANGE fk_order fk_order INT NOT NULL');
        $this->addSql('ALTER TABLE order_status_log CHANGE id_order_status_log id_order_status_log INT AUTO_INCREMENT NOT NULL, CHANGE fk_order fk_order INT NOT NULL');
        $this->addSql('ALTER TABLE order_to_service DROP FOREIGN KEY FK_DCDF5A7211B2A7FE');
        $this->addSql('ALTER TABLE order_to_service DROP FOREIGN KEY FK_DCDF5A7234C4B0ED');
        $this->addSql('DROP INDEX idx_dcdf5a7234c4b0ed ON order_to_service');
        $this->addSql('CREATE INDEX fk_service_has_order_order1_idx ON order_to_service (fk_order)');
        $this->addSql('DROP INDEX idx_dcdf5a7211b2a7fe ON order_to_service');
        $this->addSql('CREATE INDEX fk_service_has_order_service1_idx ON order_to_service (fk_service)');
        $this->addSql('ALTER TABLE order_to_service ADD CONSTRAINT FK_DCDF5A7211B2A7FE FOREIGN KEY (fk_service) REFERENCES service (id_service)');
        $this->addSql('ALTER TABLE order_to_service ADD CONSTRAINT FK_DCDF5A7234C4B0ED FOREIGN KEY (fk_order) REFERENCES `order` (id_order)');
        $this->addSql('ALTER TABLE order_to_vehicle_ecu_file DROP FOREIGN KEY FK_2360B0C634C4B0ED');
        $this->addSql('ALTER TABLE order_to_vehicle_ecu_file DROP FOREIGN KEY FK_2360B0C680786249');
        $this->addSql('DROP INDEX idx_2360b0c680786249 ON order_to_vehicle_ecu_file');
        $this->addSql('CREATE INDEX fk_order_has_vehicle_ecu_file_vehicle_ecu_file1_idx ON order_to_vehicle_ecu_file (fk_vehicle_ecu_file)');
        $this->addSql('DROP INDEX idx_2360b0c634c4b0ed ON order_to_vehicle_ecu_file');
        $this->addSql('CREATE INDEX fk_order_has_vehicle_ecu_file_order1_idx ON order_to_vehicle_ecu_file (fk_order)');
        $this->addSql('ALTER TABLE order_to_vehicle_ecu_file ADD CONSTRAINT FK_2360B0C634C4B0ED FOREIGN KEY (fk_order) REFERENCES `order` (id_order)');
        $this->addSql('ALTER TABLE order_to_vehicle_ecu_file ADD CONSTRAINT FK_2360B0C680786249 FOREIGN KEY (fk_vehicle_ecu_file) REFERENCES vehicle_ecu_file (id_vehicle_ecu_file)');
        $this->addSql('ALTER TABLE order_vehicle_data CHANGE fk_vehicle_model fk_vehicle_model INT NOT NULL');
        $this->addSql('ALTER TABLE service CHANGE fk_category fk_category INT NOT NULL');
        $this->addSql('ALTER TABLE user CHANGE is_confirmed is_confirmed TINYINT(1) DEFAULT \'0\', CHANGE is_admin is_admin TINYINT(1) DEFAULT \'0\' NOT NULL');
        $this->addSql('ALTER TABLE vehicle_ecu_file CHANGE hash hash VARCHAR(255) DEFAULT NULL COLLATE latin1_swedish_ci');
        $this->addSql('ALTER TABLE vehicle_model CHANGE fk_vehicle_make fk_vehicle_make INT NOT NULL');
    }
}
