package codeOrchestra.rgs.client.sshd.flitering;

/**
 * @author Alexander Eliseyev
 */
public interface ISyncBlockerCondition {

  boolean met(String relativePath);

}
